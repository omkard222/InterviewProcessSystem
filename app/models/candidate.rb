class Candidate < ApplicationRecord
  belongs_to :requirement
  mount_uploader :resume
  has_one :scheduler

  validates :resume, presence: true

end
