class RemoveStartTimeFromScheduler < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedulers, :start_time, :time
  end
end
