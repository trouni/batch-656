require 'faker'

puts 'Destroying all restaurants...'
Restaurant.destroy_all

puts "Creating restaurants..."
20.times do
  Restaurant.create!(
    name: Faker::TvShows::RickAndMorty.character,
    address: Faker::TvShows::RickAndMorty.location
  )
end
puts "Complete!"