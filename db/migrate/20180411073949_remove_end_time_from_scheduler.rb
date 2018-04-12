class RemoveEndTimeFromScheduler < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedulers, :end_time, :time
  end
end
