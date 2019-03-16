Good.destroy_all
Service.destroy_all
Shareable.destroy_all
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
  product = 'Avocadoes'
  Good.create(
    description: product,
    shareable: Shareable.new(user: user, product_name: product)
  )
end

p "#{User.count} users created"
p "#{Building.count} buildings created"
p "#{Shareable.count} shareables created"
p "#{Good.count} goods created"
