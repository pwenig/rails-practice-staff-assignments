require 'rails_helper'

feature Assignment do

  scenario "Cannot create assignment without role" do
    create_user email: "user@example.com"
    create_person
    Location.create!(name: "Chicago")

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on 'Mr. Jim Jones'
    click_on '+ Add Location'

    select "Chicago", from: "assignment_location_id"
    fill_in "Role", with: ""

    click_on "Assign"

    expect(page).to have_content "This assignment could not be created. Role can't be blank"
  end

  scenario "Cannot create assignment without location" do
    create_user email: "user@example.com"
    create_person
    Location.create!(name: "Chicago")

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on 'Mr. Jim Jones'
    click_on '+ Add Location'

    fill_in "Role", with: "Supervisor"

    click_on "Assign"

    expect(page).to have_content "This assignment could not be created. Location can't be blank"
  end
end