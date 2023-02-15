class Person < ApplicationRecord
  belongs_to :branch
  validates :name, :email, :mobile, presence: true
  validates :nid, numericality: { only_integer: true }
  validates :email, :mobile, uniqueness: true
end
