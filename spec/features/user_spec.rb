require 'rails_helper'
require 'capybara/rspec'

feature User do

  scenario 'User can see a person show page' do
    create_user email: "user@example.com"
    create_person

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on 'Mr. Jim Jones'
    expect(page).to have_content "Jim Jones"
  end
  
end