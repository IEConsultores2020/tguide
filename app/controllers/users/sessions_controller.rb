# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    skip_before_action :check_concurrent_session

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    def create
      super
      # after the user signs in successfully, set the current login token
      set_login_token
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    #   # after the user signs out successfully, destroy the current login token
    #   destroy_login_token
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
    private

    def set_login_token
      token = Devise.friendly_token
      session[:login_token] = token
      current_user.current_login_token = token
      current_user.save
    end

    # def destroy_login_token
    #   current_user = nil
    #   curren_user.save
    # end
  end
end
