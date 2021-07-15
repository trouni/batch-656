require_relative 'chef'

class Restaurant
  attr_reader :name, :location, :category, :chef
  attr_accessor :capacity

  # Class method
  # called using Restaurant.categories
  def self.categories
    %w[izakaya burgers french italian]
  end

  def initialize(name, location, category, capacity, chef_name)
    @name = name
    @location = location
    @category = category
    @capacity = capacity
    @clients = []
    @chef = Chef.new(chef_name, self) # self refers to the instance on which the instance method is called
  end

  def open?
    # Open between 6pm and 10pm
    Time.now.hour >= 18 && Time.now.hour <= 22
  end

  def make_reservation(name)
    @clients << name
  end

  def display_reservations
    puts '=' * 20
    puts "#{name}'s reservations:"
    @clients.each_with_index do |client, index|
      puts "#{index + 1}. #{client}"
    end
  end
end
