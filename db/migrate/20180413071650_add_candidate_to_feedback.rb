class AddCandidateToFeedback < ActiveRecord::Migration[5.1]
  def change
    add_reference :feedbacks, :candidate, foreign_key: true
    add_column :feedbacks, :opportunityID, :string
  end
end
