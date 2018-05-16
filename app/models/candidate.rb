class Candidate < ApplicationRecord
  resourcify
  belongs_to :requirement
  mount_uploader :resume
  has_many :schedulers, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :resume, presence: true


  def candidate_full_name
    self.first_name + " " + self.last_name
  end

  
end
