require 'spec_helper'

describe "Admin delete team" do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:team) { FactoryGirl.create(:team) }
  let!(:team_2) { FactoryGirl.create(:team) }
  
  before :each do
    admin.confirm!
    sign_in_as!(admin)
  end
  
  it "should delete team", :js => true do
    click_link "TEAMS"
    page.find("#delete-resource-#{team.id}").click
    page.find("#delete-confirm").click

    expect(page).to have_content("Team 1 has been successfully deleted!")
    expect(page).to have_content("#{team_2.name}")
  end
end