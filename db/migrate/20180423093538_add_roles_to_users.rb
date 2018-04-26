class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin_role, :boolean, default: false
    add_column :users, :manager_role, :boolean, default: false
    add_column :users, :hr_role, :boolean, default: false
    add_column :users, :interviewer_role, :boolean, default: false
  end
end
