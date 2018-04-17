class AddRoundTypeToFeedback < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :round_type, :string
  end
end
