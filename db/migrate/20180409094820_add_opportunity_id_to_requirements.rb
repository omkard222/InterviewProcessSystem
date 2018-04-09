class AddOpportunityIdToRequirements < ActiveRecord::Migration[5.1]
  def change
    add_column :requirements, :opportunityID, :string
  end
end
