class RemoveEmpSkillsFromEmployee < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :emp_skills, :string
  end
end
