class Scheduler < ApplicationRecord
  resourcify
  belongs_to :candidate
  belongs_to :requirement
  has_many :feedbacks
  belongs_to :user
  validate :interview_date_is_equal_or_greater_than_today




  private

  def interview_date_is_equal_or_greater_than_today
    return if interview_date.blank?
    if interview_date < (Date.today)
      errors.add(:interview_date, "cannot be a date before today")
    end
  end



end
