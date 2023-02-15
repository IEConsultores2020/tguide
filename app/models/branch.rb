class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :tracks
  has_many :people
  validates :name, presence: true
  validates :name, uniqueness: true

  def company_name
    company.try(:name)
  end 

end
