require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation tests' do
    it 'ensures name presence' do
        user = User.new(name:'om').save
        expect(user).to eq(false)

    end

  end

end
