class Car
  attr_accessor :color # creates both attr_reader and attr_writer
  attr_reader :brand

  # attr_writer :color

  # constructor - runs when calling Car.new
  def initialize(color, brand = 'Toyota')
    # DATA
    # @instance_variable
    @color = color # string
    @brand = brand
    @engine_started = false # boolean
  end

  # BEHAVIOUR
  # def instance_method
  def start!
    check_oil
    power_battery
    inject_fuel
    crank_engine
    @engine_started = true
  end

  # Can't use attr_reader for custom names with `?`
  def engine_started?
    @engine_started
  end

  # `attr_reader :brand` just creates the method below
  # def brand
  #   @brand
  # end

  # attr_reader :color
  # def color
  #   @color
  # end

  # attr_writer :color
  # def color=(new_color)
  #   @color = new_color
  # end

  private

  def check_oil
    puts 'Checking oil levels...'
  end

  def power_battery
    puts 'Powering battery...'
  end

  def inject_fuel
    puts 'Injecting fuel...'
  end

  def crank_engine
    puts 'Cranking engine...'
  end
end

seira = Car.new('blue')

puts "Seira's car is a #{seira.color} #{seira.brand}"

puts "The engine of the car is #{seira.engine_started? ? 'on' : 'off'}"

seira.start!

puts "The engine of the car is #{seira.engine_started? ? 'on' : 'off'}"

puts 'Seira paints the car purple...'
seira.color = 'purple'

puts "Seira's car is a #{seira.color} #{seira.brand}"
