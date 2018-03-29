class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :emp_firstname
      t.string :emp_lastname
      t.integer :emp_id
      t.string :emp_designation
      t.string :emp_skills
      t.string :emp_mail
      t.string :emp_phone

      t.timestamps
    end
  end
end
