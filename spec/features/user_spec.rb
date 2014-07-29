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

  scenario 'User can edit a person' do
    create_user email: "user@example.com"
    create_person

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on 'Mr. Jim Jones'
    click_on 'Edit'

    fill_in 'person[first_name]', with: "John"
    fill_in 'person[last_name]', with: "Jones"
    click_on 'Update Person'

    expect(page).to have_content "John Jones"
  end

  scenario 'User can add a user to a location' do
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
    fill_in "Role", with: "Supervisor"

    click_on "Assign"

    expect(page).to have_content "Jim Jones"
    expect(page).to have_content "Chicago"
    expect(page).to have_content "Supervisor"
  end

end