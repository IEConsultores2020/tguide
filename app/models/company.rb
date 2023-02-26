class Company < ApplicationRecord
    has_many :branchs
    validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z ]+\Z/ }
end
