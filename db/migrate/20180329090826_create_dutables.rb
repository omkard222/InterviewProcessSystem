class CreateDutables < ActiveRecord::Migration[5.1]
  def change
    create_table :dutables do |t|
      t.string :du_name
      t.integer :du_id_code
      t.text :du_description

      t.timestamps
    end
  end
end
