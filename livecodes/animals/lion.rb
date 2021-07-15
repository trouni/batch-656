require_relative 'animal'

class Lion < Animal
  def talk
    "#{name} roars"
  end
  
  def eat(food)
    "#{super} It's the circle of life!"
  end
end