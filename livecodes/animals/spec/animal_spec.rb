require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'returns an instance of Animal' do
      animal = Animal.new('Geoff')
      expect(animal).to be_an(Animal)
    end
  end

  describe '#name' do
    it 'returns the name of the animal' do
      animal = Animal.new('Geoff')
      expect(animal.name).to eq('Geoff')
    end
  end

  describe '#eat(food)' do
    it 'returns a sentence to describe the animal eating' do
      animal = Animal.new('Geoff')
      expect(animal.eat('a scorpion')).to eq('Geoff eats a scorpion.')
    end
  end

  describe '::phyla' do
    it 'return the four phylas of the animal kingdom' do
      phylas = [ 'worm stuff', 'molluscs or shell guys', 'sea cucumber friends', 'the ones with the back end' ]
      expect(Animal.phyla).to eq(phylas)
    end
  end
end