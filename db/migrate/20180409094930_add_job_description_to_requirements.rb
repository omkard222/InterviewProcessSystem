class AddJobDescriptionToRequirements < ActiveRecord::Migration[5.1]
  def change
    add_column :requirements, :job_description, :string
    add_column :requirements, :job_summary, :string
  end
end
