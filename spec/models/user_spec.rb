require 'rails_helper'

describe Person do

  it "person cannot be added without last_name" do
    person = Person.new(title: "Mr", first_name: "Jim", last_name: "")
    expect(person.custom_validate).to eq ["This person could not be created. You must enter a title/last name/first name"]
  end


end