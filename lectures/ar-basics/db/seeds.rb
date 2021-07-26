require 'faker'

puts 'Creating 10 fake restaurants...'
10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address
  )
end
puts 'Seeds completed!'