class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :employee_id, :integer
    add_column :users, :designation, :string
    add_column :users, :phone_no, :string
    add_column :users, :role, :string
  end
end
