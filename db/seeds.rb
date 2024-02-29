# Create a main sample user.
User.create!(name:  "Example User",
             email: "example1@ITFCM.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: 5)

User.create!(name:  "Example User",
             email: "example2@ITFCM.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: 3)

User.create!(name:  "Example User",
             email: "example3@ITFCM.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: 2)

# Generate a bunch of additional users.
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@ITFCM.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end