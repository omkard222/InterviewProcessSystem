class Candidate < ApplicationRecord
  belongs_to :requirement
  mount_uploader :resume
  has_many :schedulers

  validates :resume, presence: true


  def candidate_full_name
    self.first_name + " " + self.last_name
  end
end
