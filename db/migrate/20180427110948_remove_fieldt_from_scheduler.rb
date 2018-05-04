class RemoveFieldtFromScheduler < ActiveRecord::Migration[5.1]
  def change
    remove_reference :schedulers, :employee, foreign_key: true
  end
end
