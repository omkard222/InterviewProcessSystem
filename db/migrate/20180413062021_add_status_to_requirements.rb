class AddStatusToRequirements < ActiveRecord::Migration[5.1]
  def change
    add_column :requirements, :status, :string
  end
end
