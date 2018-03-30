class AddDutableToProject < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :dutable, foreign_key: true
  end
end
