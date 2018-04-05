class CreateSchedulers < ActiveRecord::Migration[5.1]
  def change
    create_table :schedulers do |t|
      t.time :start_time
      t.time :end_time
      t.date :interview_date
      t.references :candidate, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :requirement, foreign_key: true

      t.timestamps
    end
  end
end
