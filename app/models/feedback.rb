class Feedback < ApplicationRecord
    resourcify
  belongs_to :scheduler
  # before_save :save_details
  belongs_to :candidate
  private

  # def save_details
  #
  #   self.candidate_id = self.scheduler.candidate_id
  #   self.opportunityID = self.scheduler.requirement.opportunityID
  #   # self.candidate_id = Scheduler.find(self.scheduler_id).candidate.id
  #   # self.opportunityID = Requirement.find(Scheduler.find(self.scheduler_id).requirement_id).opportunityID
  #
  # end
end
