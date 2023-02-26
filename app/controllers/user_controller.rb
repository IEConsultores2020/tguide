class UserController < ApplicationController

    def branch_name
        branch = Branch.where(user_id: current_user.id).order(id: :asc).first
      return branch.name
    end  
    
end
