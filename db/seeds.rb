# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Place.delete_all
Booking.delete_all

10.times do |n|
  User.create(email: "test#{n}@asd.com",
              password: 'asdasdasd',
              password_confirmation: 'asdasdasd')
end

15.times do |n|
  Place.create(name: "Netguru Room #{n}",
               price: rand(100),
               description: 'cool place',
               user_id: User.order("RANDOM()").first.id)
end

150.times do |n|
  random_date = Time.now + rand(15).days
  User.first.bookings.create!(place_id: Place.offset(rand(10)).first.id,
                              date_from: random_date,
                              date_to: random_date + 15.days,
                              confirmation: false)
end
