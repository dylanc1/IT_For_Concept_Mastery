# Create a main sample user.
User.create!(name:  "Example Dev Admin",
             email: "example1@ITFCM.org",
             password:              "Foobar1!",
             password_confirmation: "Foobar1!",
             admin: 5)

User.create!(name:  "Example User Admin",
             email: "example2@ITFCM.org",
             password:              "Foobar1!",
             password_confirmation: "Foobar1!",
             admin: 3)

User.create!(name:  "Example Manager Admin",
             email: "example3@ITFCM.org",
             password:              "Foobar1!",
             password_confirmation: "Foobar1!",
             admin: 2)

# Generate a bunch of additional users.
20.times do |n|
  name  = Faker::Name.first_name + " " + Faker::Name.last_name
  email = "example-#{n+1}@ITFCM.org"
  password = "Password1!"
  puts name
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

skill1 = Skill.create!(name: "Basic addition",
              description: "Addition of 2 positive numbers")

skill2 = Skill.create!(name: "Math review",
              description: "Review of basic math topics")
              
question1 = Question.create!(content: "2 + 8 = ?",
                 answer: "10")

question2 = Question.create!(content: "3 + 5 = ?",
                 answer: "8")

question3 = Question.create!(content: "8 * 9 = ?",
                 answer: "72")
                 
question1.answer_choices.create!(content: "5")
question1.answer_choices.create!(content: "8")
question1.answer_choices.create!(content: "10")
question1.answer_choices.create!(content: "13")

question2.answer_choices.create!(content: "7")
question2.answer_choices.create!(content: "8")
question2.answer_choices.create!(content: "9")
question2.answer_choices.create!(content: "10")

question3.answer_choices.create!(content: "64")
question3.answer_choices.create!(content: "66")
question3.answer_choices.create!(content: "69")
question3.answer_choices.create!(content: "72")

skill1.questions << [question1, question2]
skill2.questions << [question1, question3]