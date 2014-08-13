require 'rails_helper'

describe 'person' do
  it "validates that person has a title/last_name or first_name/last_name" do
    person = Person.create!(
                              title: "Mr",
                              first_name: "Joe",
                              last_name: "Example")
    expect(person.valid?).to eq true
  end

  it "validates that person has a title/last_name or first_name/last_name" do
    person = Person.create(
      title: "Mr",
      first_name: "Joe",
      last_name: "")
    expect(person.valid?).to eq false
  end

end