class AddFieldToScheduler < ActiveRecord::Migration[5.1]
  def change
    add_reference :schedulers, :user, foreign_key: true
  end
end
