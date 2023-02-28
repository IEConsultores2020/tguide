# frozen_string_literal: true

class UserController < ApplicationController
  def branch_name
    branch = Branch.where(user_id: current_user.id).order(id: :asc).first
    branch.name
  end
end
