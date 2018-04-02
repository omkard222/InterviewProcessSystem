class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements do |t|
      t.string :position
      t.string :skills
      t.integer :experience
      t.integer :salary
      t.string :qualification

      t.timestamps
    end
  end
end
