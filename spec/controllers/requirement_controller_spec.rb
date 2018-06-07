require 'rails_helper'

RSpec.describe RequirementsController, type: :controller do

  describe 'POST create' do
     context 'creates new requirement' do
       it 'ensure requirement created' do
         @requirement = Requirement.new(status: "open",position:"xxx", skills:"java", experience:"1",qualification:"bc", opportunityID:"123", skill_id:"1", project_id:"7", job_description:"xyz",job_summary:"xyz").save
         expect(@requirement).to eq(true)
      end

      it 'ensure requirement created' do
        @requirement = Requirement.new(status: "open",position:"xxx", skills:"java", experience:"1",qualification:"bc", opportunityID:"123", skill_id:"1", job_description:"xyz",job_summary:"xyz").save
        expect(@requirement).to eq(true)
      end

     end
   end
end
