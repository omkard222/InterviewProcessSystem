class Employee < ApplicationRecord
    has_and_belongs_to_many :projects
    has_one :scheduler
    has_many :employee_requirement_skills, as: :employee_requirement_skillable

    attr_accessor :skill_id

    before_save :build_emp_skills

    def build_emp_skills
      if new_record?
        self.employee_requirement_skills.build(skill_id: self.skill_id)
      end
    end

    def self.get_employees_from_requirements(requirement)
      skill_ids = requirement.employee_requirement_skills.pluck(:skill_id)
      employee_ids = EmployeeRequirementSkill.where(employee_requirement_skillable_type: "Employee", skill_id: skill_ids).pluck(:employee_requirement_skillable_id)
      employees = Employee.where(id: employee_ids)
    end

    def full_name
      self.emp_firstname + " " + self.emp_lastname
    end
  end
