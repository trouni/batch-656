require_relative '../french_ssn.rb'

describe '#french_ssn_info' do
  it 'returns a "The number is invalid" when given an empty string' do
    expected = 'The number is invalid'
    actual = french_ssn_info('')
    expect(actual).to eq(expected) # actual == expected
  end

  it 'returns "a man, born in May, 1982 in Bouches-du-Rhône." when given "1 82 05 13 123 234 79"' do
    expected = 'a man, born in May, 1982 in Bouches-du-Rhône.'
    actual = french_ssn_info('1 82 05 13 123 234 79')
    expect(actual).to eq(expected) # actual == expected
  end

  it 'returns a "The number is invalid" when given an invalid ssn' do
    expected = 'The number is invalid'
    actual = french_ssn_info('1 82 05 13 123 234 23')
    expect(actual).to eq(expected) # actual == expected
  end
end