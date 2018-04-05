class EmployeeRequirementSkill < ApplicationRecord
    belongs_to :employee_requirement_skillable, polymorphic: true
    belongs_to :skill
end
