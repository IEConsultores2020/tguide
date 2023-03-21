# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_track, only: %i[show edit update destroy]

  def default_assigned_id
    session[:person_id] = params[:person_id] if params[:person_id].present?
    assigned_id = session[:person_id]
    puts "assigned_id #{assigned_id}"
    return assigned_id
  end
  helper_method :default_assigned_id

  def default_assigned_name
     Person.where(id: default_assigned_id).pluck(:name)[0]
  end
  helper_method :default_assigned_name

  def default_branch_id
    Person.where(id: default_assigned_id).pluck(:branch_id)[0]
  end
  helper_method :default_branch_id

  def default_branch_name
    Branch.where(id: default_branch_id).pluck(:name)[0]
  end
  helper_method :default_branch_name

  # GET /tracks or /tracks.json
  def index
    @pagy, @tracks = pagy(Track.where(owner_id: current_user.id,
                          assigned_id: session[:person_id]).where("code LIKE ?",
                                                          "%#{params[:filter]}%").order(status: :asc, created_at: :asc))
  end

  # GET /tracks/1 or /tracks/1.json
  def show; end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit; end

  # POST /tracks or /tracks.json
  def create
    @track = Track.new(track_params)
    @track.owner_id = current_user.id
    @track.status = 0
    respond_to do |format|
      if @track.save
        format.turbo_stream
        format.html { redirect_to track_url(@track), notice: 'Track was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@track)}_form", partial: 'form',
                                                                                      locals: { track: @track })
        end
      end
    end
  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to track_url(@track), notice: 'Track was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@track)}_form", partial: 'form',
                                                                                      locals: { track: @track })
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  def destroy
    @track.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@track)}_item") }
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list
    session['filters'] = {} if session['filters'].blank?
    session['filters'].merge!(filter_params)
    @tracks = Track.where(owner_id: current_user.id,
                          assigned_id: session[:person_id]).where("code LIKE ?",
                                                          "%#{params[:filter]}%").order(status: :asc, created_at: :asc)
    render(partial: 'tracks', locals: { tracks: @tracks })
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_track
    @track = Track.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def track_params
    params.require(:track).permit(:code, :status, :branch_id, :assigned_id, :owner_id)
  end
end
