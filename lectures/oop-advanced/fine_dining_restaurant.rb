require_relative 'restaurant'

class FineDiningRestaurant < Restaurant
  attr_reader :stars

  def initialize(name, location, category, capacity, stars)
    super(name, location, category, capacity)
    @stars = stars
  end

  def open?
    super || Time.now.hour >= 11 && Time.now.hour <= 15
  end
end