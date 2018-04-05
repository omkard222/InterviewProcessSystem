module ApplicationHelper

  def get_skills(obj)
    skill_ids = obj.employee_requirement_skills.pluck(:skill_id) rescue []
    skills = Skill.where(id: skill_ids)
  end
end
