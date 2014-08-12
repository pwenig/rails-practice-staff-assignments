require 'rails_helper'

feature 'user' do

  scenario 'user clicks on name and sees show page' do
    create_user
    create_person
    login
    click_on "Mr Joe Example"
    expect(page).to have_content "Joe Example"
  end

  scenario 'user can edit people' do
    create_user
    create_person
    login
    click_on "Mr Joe Example"
    click_on "Edit"
    fill_in "person[first_name]", with: "Joe"
    fill_in "person[last_name]", with: "Perry"
    click_on "Update Person"
    expect(page).to have_content "Joe Perry"
    expect(page).to_not have_content "Joe Example"
  end
end