# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # perform the check before each controller action are executed
  before_action :check_concurrent_session
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def check_concurrent_session
    return unless already_logged_in?

    # sign out the previously logged in user, only left the newly login user
    sign_out_and_redirect(current_user)
  end

  def already_logged_in?
    # if current user is logged in, but the user login token in session
    # doesn't match the login token in database,
    # which means that there is a new login for this user
    current_user && session[:login_token] != current_user.current_login_token
  end
end
