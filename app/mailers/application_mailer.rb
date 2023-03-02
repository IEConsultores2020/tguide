# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  #default from: 'dontreply@nanducho.com'
  #layout 'mailer'

  include Devise::Controllers::UrlHelpers
  include Devise::Mailers::Helpers
  default template_path: 'users/mailer'

  def welcome_reset_password_instructions(user)
    mail(to: user.email, subject: 'Welcome to the New Site')
  end

  def reset_password_instructions(record, opts={})
    mail(:to => record, :subject => "Reset Password Instructions")
 end

end

