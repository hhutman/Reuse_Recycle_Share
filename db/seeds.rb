Good.destroy_all
Service.destroy_all
Profile.destroy_all
User.destroy_all
Building.destroy_all


puts "Deleted old records, creating new records"
10.times do
  building = Building.create!(
    building_name: Faker::Name.first_name,
    address: Faker::Address.street_address
  )
  10.times do
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'asdfasdf',
      building: building
    )

    profile = Profile.create!(address: "1001 Here St.", user: user )
    url = "https://randomuser.me/api/portraits/med/#{['men', 'women'].sample}/#{profile.id}.jpg"
    image = open(url)
    profile.pic.attach(io: image, filename: "pic.jpg")

    5.times do
      Good.create!(description: Faker::Food.dish, user: user)
      Service.create!(description: Faker::Job.field, user: user)
    end
  end
end

p "#{User.count} users created"
p "#{Profile.count} profiles created"
p "#{Building.count} buildings created"
p "#{Good.count} goods created"
p "#{Service.count} services created"
