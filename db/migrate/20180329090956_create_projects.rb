class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :pro_idcode
      t.text :pro_description

      t.timestamps
    end
  end
end
