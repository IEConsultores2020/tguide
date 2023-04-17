class SiteController < ApplicationController
  before_action :find_mmy

  def index
    @branches = Branch.all
    @people = @branch&.people || []
  end

  private

    def find_mmy
      @branch = Branch.find_by(id: params[:branch].presence)
      @person = Person.find_by(id: params[:person].presence)
    end
end
