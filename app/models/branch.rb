class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :tracks
end
