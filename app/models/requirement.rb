class Requirement < ApplicationRecord
  has_many :candidates
  has_one :scheduler
  has_many :employee_requirement_skills, as: :employee_requirement_skillable
  belongs_to :project

  attr_accessor :skill_id

  before_save :build_requirement_skills



  def build_requirement_skills
    if new_record?
      self.employee_requirement_skills.build(skill_id: self.skill_id)
    end
  end

end
