# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
User.destroy_all
Building.destroy_all


25.times do
  Building.create(
   building_name: Faker::Name.first_name,
   address: Faker::Address.street_address
 )
  end

25.times do
  User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  building_id: Building.all.sample.id
)
end

tester = User.create(  first_name: "tester",
          last_name: "McTester",
          email: "test@email.com",
          password: "password",
          building_id: Building.first.id
        )


user = User.first
5.times do
  Good.create(description: "things", availability: "tomorrow", more_information: "nope", is_offer: false, user_id: tester.id)
end

5.times do
  Good.create(description: "need", availability: "yesterday", more_information: "lots", is_offer: true, user_id: tester.id)
end

puts "Things created"
