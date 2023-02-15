class Company < ApplicationRecord
    has_many :branchs
    validates :name, presence: true
    validates :name, uniqueness: true
end
