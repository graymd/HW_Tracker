task create_users: :environment do

  User.create!({
    email: Faker::Internet.email,
    password: "password",
    admin: 1,
    role: "na",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    github_account: Faker::Hacker.noun
  })



  19.times do
    User.create!({
      email: Faker::Internet.email,
      password: "password",
      admin: [0,1].sample,
      role: "na",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      github_account: Faker::Hacker.noun
    })
  end

  20.times do
    Location.create!({
      street_address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip_code: Faker::Address.zip,
      open_date: Faker::Date.between(2.years.ago, Date.today)
    })
  end

  20.times do
    Course.create!({
      name:["rails", "javascript", "ios"].sample,
      description: Faker::Lorem.sentence
      })
  end

  x = 1
  20.times do
    20.times do
      Link.create!({
      url: Faker::Internet.url,
      submission_id: x
        })
    end
    x+=1
  end

  20.times do
    Assignment.create!({
      name: Faker::Lorem.word,
      requirements: Faker::Lorem.paragraph,
        user_id: 1
        })
    end


  y = 1
    20.times do
      20.times do
        x = 1
        20.times do
        Submission.create!({
          workflow_state: "new",
          name: Faker::Lorem.word,
          input: Faker::Lorem.paragraph, 
          assignment_id: x,
          user_id: y
          })
        end
        x += 1
      end
      y += 1
    end
end