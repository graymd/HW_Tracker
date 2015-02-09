# task create_users: :environment do 
#   x = 0 
#   20.times do
#     User.create!({
#       email: "test_#{x}@test.com",
#       encrypted_password: '#$taawktljasktlw4aaglj',
#       admin: [
#         0,
#         1
#       ].sample,
#       role: ["Student", "Instructor/TA"]
#       })
#     user.skip_confirmation!
#     user.save!
#     x += 1

#   end


# end


does not work