task create_locations: :environment do 
  20.times do
    Location.create!({
      street_address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip_code: Faker::Address.zip,
      open_date: Faker::Date.between(2.years.ago, Date.today)
    })
  end
end