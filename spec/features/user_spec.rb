require 'rails_helper'

feature 'user' do

  scenario 'user clicks on name and sees show page' do
    create_user
    create_person
    login
    click_on "Mr Joe Example"
    expect(page).to have_content "Joe Example"
  end
end