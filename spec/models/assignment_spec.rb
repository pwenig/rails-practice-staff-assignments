require 'rails_helper'

describe Assignment do

  it "is not valid if role and location are not unique to person" do
  location = Location.create!(name: "Chicago")
    Assignment.create!(location_id: location.id, role: "President")
    assignment = Assignment.new(location_id: location.id, role: "President")
    expect(assignment.valid?).to eq false
    expect(assignment).to have(1).error_on :role

  end
end