class Candidate < ApplicationRecord
  belongs_to :requirement
  mount_uploader :resume
end
