require 'rspec'
require_relative '../lib/mapper.rb'

describe Mapper do
  let (:number_map) {
    {
      '2' => ['A','B','C'],
      '3' => ['D','E','F'],
      '4' => ['G','H', 'I'],
      '5' => ['J', 'K', 'L'],
      '6' => ['M', 'N', 'O'],
      '7' => ['P', 'Q', 'R', 'S'],
      '8' => ['T', 'U', 'V'],
      '9' => ['W', 'X', 'Y', 'Z']
    }
  }
  
  describe 'valid number' do
    it 'returns true' do
      number = Mapper.new('6686787825')
      expect(number.valid_number?).to be true
    end
  end

  describe 'invalid number' do
    it 'returns false' do
      number = Mapper.new('1686787825')
      expect(number.valid_number?).to be false
    end
  end

  describe 'number to string mapper' do
    it 'returns array containing a map of strings' do
      num = Mapper.new('6686787825')
      result = [["M", "N", "O"], ["M", "N", "O"], ["T", "U", "V"], ["M", "N", "O"], ["P", "Q", "R", "S"], ["T", "U", "V"], ["P", "Q", "R", "S"], ["T", "U", "V"], ["A", "B", "C"], ["J", "K", "L"]]
      expect(num.number_to_string).to eql(result)
    end
  end
end
