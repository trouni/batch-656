require_relative '../meerkat'

describe Meerkat do
  describe '#initialize' do
    it 'returns an instance of Meerkat' do
      meerkat = Meerkat.new('Napoleon')
      expect(meerkat).to be_a(Meerkat)
    end
  end

  describe '#name' do
    it 'returns the name of the meerkat' do
      meerkat = Meerkat.new('Napoleon')
      expect(meerkat.name).to eq('Napoleon')
    end
  end

  describe '#talk' do
    it 'returns the sound the meerkat makes' do
      meerkat = Meerkat.new('Napoleon')
      expected = 'Napoleon barks'
      expect(meerkat.talk).to eq(expected)
    end
  end
end