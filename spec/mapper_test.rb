require 'rspec'
require_relative '../lib/mapper.rb'

describe Mapper do
  describe 'valid number' do
    it 'returns true' do
      number = Mapper.new('6686787825')
      expect(number.valid_number?).to be true
    end
  end

  describe 'invalid number' do
    it 'returns false for number containing 1' do
      number = Mapper.new('1686787825')
      expect(number.valid_number?).to be false
    end
  end
end
