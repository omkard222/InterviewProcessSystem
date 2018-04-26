class RemoveRolesFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admin_role, :boolean, default: false
    remove_column :users, :manager_role, :boolean, default: false
    remove_column :users, :hr_role, :boolean, default: false
    remove_column :users, :interviewer_role, :boolean, default: false
  end
end
