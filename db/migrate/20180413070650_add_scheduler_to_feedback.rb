class AddSchedulerToFeedback < ActiveRecord::Migration[5.1]
  def change
    add_reference :feedbacks, :scheduler, foreign_key: true
  end
end
