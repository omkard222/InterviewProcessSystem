class ChangeStatusInRequirements < ActiveRecord::Migration[5.0]
  def change
    change_column :requirements, :status, :string, :default => 'open'
  end
end
