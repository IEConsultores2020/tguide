# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :tracks
  has_many :people
  validates :name, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z ]+\Z/ }
  enum status: { delivered: 0, received: 1 }

  def company_name
    company.try(:name)
  end
end
