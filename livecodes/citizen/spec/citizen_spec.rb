require_relative "../citizen"

describe Citizen do
  describe '#can_vote?' do
    it 'return true if the age of the citizen is at least 18' do
      citizen = Citizen.new('Douglas', 'Sensei', 53)
      actual = citizen.can_vote?
      expect(actual).to eq(true)
    end

    it 'return false if the age of the citizen is at below 18' do
      citizen = Citizen.new('Sae', 'Shikiji', 17)
      actual = citizen.can_vote?
      expect(actual).to eq(false)
    end
  end
end