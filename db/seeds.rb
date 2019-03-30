Good.destroy_all
Service.destroy_all
Profile.destroy_all
User.destroy_all
Building.destroy_all



p "Deleted old records, creating new records"

buildings = [
  {
    building_name: "One Paraiso",
    address: "3131 NE 7th Avenue"
  },
  {
    building_name: "Icon Brickell",
    address: "465 Brickell Ave"
  },
  {
    building_name: "Maria",
    address: "1643 Brickell Ave"
  },
  {
    building_name: "Asia",
    address: "900 Brickell Key Blvd"
  },
  {
    building_name: "Grove at Grand Bay",
    address: "2669 S Bayshore Dr"
  }
]

5.times do |b|
  building = Building.create!(buildings[b])
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

    1.times do
      Good.create!(description: ["Avocados  I have extra, LMK if you want them", "Camping Equipment  We're going camping June 8-9 and need a tent for the kids.", "Tools  Our dining room table leg is loose.  Can anyone lend me some tools for the afternoon?", "6 year-old birthday party favors  We have leftover party favors that I don't want to throw away, any takers?", "Beach Chairs My mother-in-law bought us two new ones.  Anyone want the two extra we have now.  They're in good shape"].sample, user: user)
      Service.create!(description: ["Any dog walkers in the building?", "Piano Lessons, I have been teaching piano for five years.  Lessons for adults or kids. ", "Math and Science Tutor  I am 15-year-old highschool sophomore.  I'm taking Calculus and Physics this year.", "I need a mother's helper to hang with the kids while I make dinner.  Any middle school/high school neighbors free from 5-6 a couple of nights a week?", "Cooking  I love to cook.  Anyone interested in a cooking club once a month?"].sample, user: user)
    end
  end
end

p "#{User.count} users created"
p "#{Profile.count} profiles created"
p "#{Building.count} buildings created"
p "#{Good.count} goods created"
p "#{Service.count} services created"
