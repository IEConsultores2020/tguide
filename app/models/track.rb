class Track < ApplicationRecord
  belongs_to :branch
  belongs_to :assigned, :class_name => 'User'
  belongs_to :owner, :class_name => 'User'
end
