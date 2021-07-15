class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.phyla
    [ 'worm stuff', 'molluscs or shell guys', 'sea cucumber friends', 'the ones with the back end' ]
  end
  
  def eat(food)
    "#{name} eats #{food}."
  end
end
