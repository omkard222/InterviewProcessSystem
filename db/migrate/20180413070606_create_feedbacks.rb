class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :stage_name
      t.string :status
      t.string :duration_of_interview
      t.string :comments
      t.string :communication
      t.string :attitude
      t.string :learning_capabilties
      t.string :Tech_analysis

      t.timestamps
    end
  end
end
