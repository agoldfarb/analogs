require 'faker'

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
    vinyl: vinyls.sample,
    body: Faker::Lorem.paragraph
    )
end

puts "Seed Finished"
puts "#{Vinyl.count} vinyls created"
puts "#{Review.count} reviews created"