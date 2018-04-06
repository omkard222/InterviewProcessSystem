class AddProjectToRequirement < ActiveRecord::Migration[5.1]
  def change
    add_reference :requirements, :project, foreign_key: true
    add_column :requirements, :description, :string 
  end
end
