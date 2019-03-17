Good.destroy_all
Service.destroy_all
Building.destroy_all
User.destroy_all


p "Deleted old records, creating new records"
25.times do |i|
  building = Building.create!(
    building_name: Faker::Name.first_name,
    address: Faker::Address.street_address
  )
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: i == 0 ? 'ed@ed.com' : Faker::Internet.email,
    password: 'asdfasdf',
    profile: Profile.new
  )
  user.buildings << building
end

p "#{User.count} users created"
p "#{Building.count} buildings created"
p "#{Good.count} goods created"
