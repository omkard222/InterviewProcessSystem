class AddStartTimeToSchedulers < ActiveRecord::Migration[5.1]
  def change
    add_column :schedulers, :start_time, :string
    add_column :schedulers, :end_time, :string
  end
end
