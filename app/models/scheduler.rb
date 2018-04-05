class Scheduler < ApplicationRecord
  belongs_to :candidate
  belongs_to :employee
  belongs_to :requirement

  validate :interview_date_is_equal_or_greater_than_today




  private

  def interview_date_is_equal_or_greater_than_today
    return if interview_date.blank?
    if interview_date < (Date.today)
      errors.add(:interview_date, "cannot be a date before today")
    end
  end



end
