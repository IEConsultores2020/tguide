class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :tracks

  def company_name
    company.try(:name)
  end 

end
