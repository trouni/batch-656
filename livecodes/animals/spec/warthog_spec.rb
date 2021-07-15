require_relative '../warthog'

describe Warthog do
  describe '#initialize' do
    it 'returns an instance of Warthog' do
      warthog = Warthog.new('Snowball')
      expect(warthog).to be_a(Warthog)
    end
  end

  describe '#name' do
    it 'returns the name of the warthog' do
      warthog = Warthog.new('Snowball')
      expect(warthog.name).to eq('Snowball')
    end
  end

  describe '#talk' do
    it 'returns the sound the warthog makes' do
      warthog = Warthog.new('Snowball')
      expected = 'Snowball grunts'
      expect(warthog.talk).to eq(expected)
    end
  end
end