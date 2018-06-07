require 'rails_helper'
Rspec.feature "add requirement" do
  scenario "add requirement" do
    requirement= create(:requirement)
    visit requirement_path(requirement)
    expect(requirement).to eq(false)
  end
end
