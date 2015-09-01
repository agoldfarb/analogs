require 'faker'

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
  end
  users = User.all

# Create Vinyl
20.times do 
  Vinyl.create!(
    title: Faker::Lorem.sentence,
    artist: Faker::Name.name,
    year: Faker::Number.number(4),
    label: Faker::Company.name
    )
end

vinyls = Vinyl.all

# Create Reviews
20.times do
  Review.create!(
    user: users.sample,
    vinyl: vinyls.sample,
    body: Faker::Lorem.paragraph
    )
end

reviews = Review.all

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Vinyl.count} vinyls created"
puts "#{Review.count} reviews created"