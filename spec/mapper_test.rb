require 'rspec'
require_relative '../lib/mapper'

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

  describe '#cartesian_product' do
    it 'returns the count of the result array' do
      expect(map_obj.cartesian_product.count).to eql(104976)
    end
  end

  describe '#breakdown' do
    it 'divides the string into sub strings of length 3 to 9' do
      result = [["WGWJAWMPPJ"], ["WGWJA", "WMPPJ"], ["WGWJ", "AWMPPJ"], ["WGWJAW", "MPPJ"], ["WGW", "JAW", "MPPJ"], ["WGW", "JAWM", "PPJ"], ["WGWJ", "AWM", "PPJ"], ["WGW", "JAWMPPJ"], ["WGWJAWM", "PPJ"]]
      expect(map_obj.breakdown('WGWJAWMPPJ')).to eql(result)
    end
  end

  describe '#convert' do
    it 'converts phone number to words' do
      expect(map_obj.convert.map(&:join).count).to eql(44) # 44 is the result for `1686787825`
    end
  end
end
