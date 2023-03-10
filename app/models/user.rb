# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :branch
  has_many :track_as_owner, foreign_key: 'owner_id', class_name: 'Track'

  def send_reset_password_instructions
    ApplicationMailer.reset_password_instructions(self.email).deliver
  end
  
end