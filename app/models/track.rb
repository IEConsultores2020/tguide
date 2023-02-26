class Track < ApplicationRecord
  after_update_commit {broadcast_append_to "tracks"}
  belongs_to :branch
  belongs_to :assigned, :class_name => 'Person'
  belongs_to :owner, :class_name => 'User'
  validates :code, presence: true
  validates :code, uniqueness: true
  enum status: { delivered: 0, received: 1}

  def branch_name
    branch.try(:name)
  end 

  def assigned_name
    assigned.try(:name)
  end 
end
