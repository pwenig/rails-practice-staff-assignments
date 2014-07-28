def create_user(overrides = {})
  User.create!({
    name: 'Some User',
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password'
  }.merge(overrides))
end

def create_person(overrides = {})
  Person.create!({
    title: "Mr.",
    first_name: "Jim",
    last_name: "Jones"
                 }.merge(overrides))
end
