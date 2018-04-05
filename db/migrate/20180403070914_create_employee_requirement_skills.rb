class CreateEmployeeRequirementSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_requirement_skills do |t|
      t.integer :employee_requirement_skillable_id
      t.string :employee_requirement_skillable_type
      t.integer :skill_id

      t.timestamps
    end
  end
end
