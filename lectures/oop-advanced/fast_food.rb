require_relative 'restaurant'

class FastFood < Restaurant
  attr_reader :prep_time

  def initialize(name, location, category, capacity, prep_time)
    super(name, location, category, capacity)
    @prep_time = prep_time
  end

  def make_reservation(name)
    puts "Hummm... Sorry, there's no reservations here."
  end

  def display_reservations
    puts "There are no reservations here."
  end
end