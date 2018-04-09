class RemoveSalaryFromRequirement < ActiveRecord::Migration[5.1]
  def change
    remove_column :requirements, :salary, :string
  end
end
