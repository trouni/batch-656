require_relative 'restaurant'
require_relative 'fine_dining_restaurant'
require_relative 'fast_food'

toriki = Restaurant.new('Toriki', 'Meguro', 'izakaya', 50)

puts "#{toriki.name} is in #{toriki.location}."

puts " #{toriki.name}'s capacity is #{toriki.capacity}."
puts " #{toriki.name} is going through construction work..."

toriki.capacity += 20

puts " #{toriki.name}'s new capacity is #{toriki.capacity}."

puts " #{toriki.name} is currently #{toriki.open? ? 'open' : 'closed'}"


puts "Derek and Kevin book #{toriki.name}..."
toriki.make_reservation('Derek')
toriki.make_reservation('Kevin')

toriki.display_reservations


puts '=' * 30
puts '=' * 30

le_bouchon = FineDiningRestaurant.new('Le Bouchon', 'Kyoto', 'french', 30, 3)

puts "#{le_bouchon.name} is in #{le_bouchon.location} and has #{le_bouchon.stars} stars."


burger_king = FastFood.new('Burger King', 'Shibuya', 'burgers', 60, 2)

puts "#{burger_king.name} is in #{burger_king.location} and has a #{burger_king.prep_time} min preparation time."


burger_king.make_reservation('Sae')
burger_king.display_reservations
