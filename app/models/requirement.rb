class Requirement < ApplicationRecord
  resourcify
  has_many :candidates, dependent: :destroy
  has_one :scheduler, dependent: :destroy
  has_many :employee_requirement_skills, as: :employee_requirement_skillable
  belongs_to :project
  before_save :build_requirement_skills
  attr_accessor :skill_id
  validates :project_id,  presence: true

  def build_requirement_skills
    if new_record?
      self.employee_requirement_skills.build(skill_id: self.skill_id)
    end
  end

  def self.search(search)

    if search
      where('status LIKE ?',"%#{search}%")
    else
      Requirement.all
    end
  end


end
