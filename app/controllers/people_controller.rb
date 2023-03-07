# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: %i[show edit update destroy]

  def branch_name
    Branch.find(user_id: current_user.id).first.name
  end
  helper_method :branch_name

  # GET /people or /people.json
  def index
    # Rails.logger.debug("debug2::" + branch_current_user.to_s)
    @people = Person.where(branch_id: branch_current_user)
  end

  def branch_current_user
    branch = Branch.where(user_id: current_user.id).order(id: :asc).first
    branch.id
  end

  def branch_name(branch_id)
    #branch = Branch.where(user_id: current_user.id).order(id: :asc).first
    #branch.name
    return Branch.where(id: branch_id)[0][:name] unless branch_id.nil?
  end
  helper_method :branch_name

  # GET /people/1 or /people/1.json
  def show; end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit; end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    @person.branch_id = branch_current_user
    puts branch_current_user
    respond_to do |format|
      if @person.save
        format.turbo_stream
        format.html { redirect_to person_url(@person), notice: 'Person was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@person)}_form", partial: 'form',
                                                                                       locals: { person: @person })
        end
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: 'Person was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@person)}_form", partial: 'form',
                                                                                       locals: { todo: @todo })
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@person)}_item") }
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:email, :name, :citizenship, :nid, :mobile, :branch_id)
  end
end
