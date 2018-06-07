require 'rails_helper'

RSpec.describe UsersController, type: :controller do

 describe 'user access' do
   before :each do
     @user = create(:user)
     session[:user_id] = @user.id
   end

   describe 'GET #index' do
     it "collects users into @users" do
        user = create(:user)
        get :index
        expect(assigns(:users)).to match_array [@user,user]
      end
   end
 end

end
