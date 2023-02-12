class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :branchs
  has_many :track_as_owner, :foreign_key => 'owner_id', :class_name => 'Track'
  has_many :track_as_assigned, :foreign_key => 'assigned_id', :class_name => 'Track'
end
