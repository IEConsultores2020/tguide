# frozen_string_literal: true

class Person < ApplicationRecord
  after_update_commit { broadcast_append_to 'people' }
  belongs_to :branch
  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\Z/ }
  validates :mobile, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :nid, uniqueness: true, numericality: { only_integer: true }
  validates :email, email: { mode: :strict, require_fqdn: true }

  has_many :track_as_assigned, foreign_key: 'assigned_id', class_name: 'Track'
end
