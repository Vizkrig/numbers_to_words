require 'rspec'
require_relative '../lib/mapper.rb'

describe Mapper do
  describe '#valid_number?' do
    it 'returns true' do
      number = Mapper.new('6686787825')
      expect(number.valid_number?).to eql(true)
    end
  end

  describe '#valid_number?' do
    it 'returns false for number containing 1' do
      number = Mapper.new('1686787825')
      expect(number.valid_number?).to eql(false)
    end
  end
end
