class RemoveDuIdCodeFromDutable < ActiveRecord::Migration[5.1]
  def change
    remove_column :dutables, :du_id_code, :integer
      remove_column :projects, :pro_idcode, :integer
  end
end
