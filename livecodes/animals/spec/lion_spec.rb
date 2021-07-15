require_relative '../lion'

describe Lion do
  describe '#initialize' do
    it 'returns an instance of Lion' do
      lion = Lion.new('Craig')
      expect(lion).to be_a(Lion)
    end
  end

  describe '#name' do
    it 'returns the name of the lion' do
      lion = Lion.new('Craig')
      expect(lion.name).to eq('Craig')
    end
  end

  describe '#talk' do
    it 'returns the sound the lion makes' do
      lion = Lion.new('Craig')
      expected = 'Craig roars'
      expect(lion.talk).to eq(expected)
    end
  end

  describe '#eat(food)' do
    it 'returns a sentence to describe the animal eating' do
      lion = Lion.new('Craig')
      expect(lion.eat('a gazelle')).to eq('Craig eats a gazelle. It\'s the circle of life!')
    end
  end
end