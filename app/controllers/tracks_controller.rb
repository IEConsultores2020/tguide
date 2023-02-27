class TracksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_track, only: %i[ show edit update destroy ]

  def assigned_name(person_id)
    return Person.where(id: person_id)[0][:name]
  end
  helper_method :assigned_name

  def assigned_branch_id(person_id)
    puts "paramspersonid1 #{person_id}"
    return Person.where(id: person_id)[0][:branch_id]  if person_id != nil
  end
  helper_method :assigned_branch_id

  def assigned_branch_name(person_id) 
    puts "paramspersonid2 #{person_id}"
    return Branch.where(id: assigned_branch_id(person_id))[0][:name] if person_id != nil
  end
  helper_method :assigned_branch_name

  # GET /tracks or /tracks.json
  def index
    @tracks = Track.where(owner_id: current_user.id, assigned_id: params[:person_id]).order(status: :asc, created_at: :asc, updated_at: :desc)
  end

  # GET /tracks/1 or /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks or /tracks.json
  def create
    @track = Track.new(track_params)
    @track.owner_id = current_user.id
    @track.status = 0
    respond_to do |format|
      if @track.save
        format.turbo_stream
        format.html { redirect_to track_url(@track), notice: "Track was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@track)}_form", partial: "form", locals: { track: @track})}
      end
    end
  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to track_url(@track), notice: "Track was successfully updated." }
      else
        format.turbo_stream{ render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@track)}_form", partial: "form", locals: { track: @track })}        
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  def destroy
    @track.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@track)}_item")} 
      format.html { redirect_to tracks_url, notice: "Track was successfully destroyed." }
      format.json { head :no_content }
    end
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
