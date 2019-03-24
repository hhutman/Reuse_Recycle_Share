Good.destroy_all
Service.destroy_all
Profile.destroy_all
User.destroy_all
Building.destroy_all



p "Deleted old records, creating new records"
5.times do
  building = Building.create!(
    building_name: ["One Paraiso", "Icon Brickell", "Maria", "Asia", "Grove at Grand Bay"].sample,
    address: ["3131 NE 7th Avenue", "465 Brickell Ave", "1643 Brickell Ave", "900 Brickell Key Blvd", "2669 S Bayshore Dr"].sample,
  )
  5.times do |n|
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'asdfasdf',
      building: building
    )
    profile = Profile.create(address: "1001 Here St.", user: user )
    url = "https://randomuser.me/api/portraits/med/#{['men', 'women'].sample}/#{n+1}.jpg"
    image = open(url)
    profile.pic.attach(io: image, filename: "pic#{n}.jpg")

    3.times do
      Good.create!(description: ["Avocados", "Eggs", "Sugar", "Olive Oil", "Bread","Tools"].sample, user: user)
      Service.create!(description: ["Walking the dog", "Painting", "Washing dishes", "Babysitting", "Cooking"].sample, user: user)
    end
  end
end

p "#{User.count} users created"
p "#{Profile.count} profiles created"
p "#{Building.count} buildings created"
p "#{Good.count} goods created"
p "#{Service.count} services created"