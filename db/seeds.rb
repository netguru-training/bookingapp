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

15.times do |n|
  User.order("RANDOM()").first.bookings.create(place_id: Place.order("RANDOM()").first.id,
                                               date_from: Time.now + rand(15).days,
                                               date_to: Time.now + rand(15).days + 15.days)
end
