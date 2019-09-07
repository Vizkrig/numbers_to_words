require 'rspec'
require_relative '../lib/mapper.rb'

describe Mapper do
  let (:map_obj) {Mapper.new('6686787825')}
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
  
  describe '#valid_number' do
    it 'returns true' do
      expect(map_obj.valid_number?).to be true
    end
  end

  describe '#valid_number' do
    it 'returns false when number is invalid' do
      invalid_map_obj = Mapper.new('1686787825')
      expect(invalid_map_obj.valid_number?).to be false
    end
  end

  describe '#number_to_string' do
    it 'returns an array containing a map of strings' do
      result = [["M", "N", "O"], ["M", "N", "O"], ["T", "U", "V"], ["M", "N", "O"], ["P", "Q", "R", "S"], ["T", "U", "V"], ["P", "Q", "R", "S"], ["T", "U", "V"], ["A", "B", "C"], ["J", "K", "L"]]
      expect(map_obj.number_to_string).to eql(result)
    end
  end

  describe '#check if a valid dictionary was created' do
    it 'call the dictionary method and verify its not empty' do
      expect(map_obj.dictionary).not_to be_empty
    end
  end
end
