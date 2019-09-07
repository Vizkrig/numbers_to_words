require 'set'

class Mapper
  attr_reader :number, :dictionary

  DICTIONARY_PATH = '/data/dictionary.txt'
  
  def initialize(number)
    @number = number

    @number_map = {
      '2' => ['A','B','C'],
      '3' => ['D','E','F'],
      '4' => ['G','H', 'I'],
      '5' => ['J', 'K', 'L'],
      '6' => ['M', 'N', 'O'],
      '7' => ['P', 'Q', 'R', 'S'],
      '8' => ['T', 'U', 'V'],
      '9' => ['W', 'X', 'Y', 'Z']
    }

    create_dictionary
    @final = []
  end

  def create_dictionary
    dict = []
    File.foreach(Dir.pwd + DICTIONARY_PATH) do |line|
      dict << line.strip
    end

    # convert dictionary arr to a Set for quick access
    @dictionary = Set.new dict
  end

  def convert
    possible_combinations = []

    cartesian_product.each do |str_array|
      str = str_array.join

      # split up the string
      possible_combinations = breakdown(str)

      possible_combinations.each do |pc|
        allocs(pc)
      end
    end
    @final
  end

  # cartesian product of characters to get string combinations
  def cartesian_product
    number_to_string.inject(&:product).map(&:flatten)
  end

  # returns a 2d array with equivalent characters for the input number
  def number_to_string
    number.chars.map {|n| @number_map[n]}
  end

  # returns array
  # WGWJAWMPPJ
  # WGWJA WMPPJ
  # 5 x 5
  # 4 x 6, 6 x 4
  # 3 x 3 x 4
  # 3 x 4 x 3
  # 4 x 3 x 3
  # 3 x 7
  # 7 x 3
  def breakdown(str)
    [
      [str],
      [str[0..4], str[5..9]],
      [str[0..3], str[4..9]],
      [str[0..5], str[6..9]],
      [str[0..2], str[3..5], str[6..9]],
      [str[0..2], str[3..6], str[7..9]],
      [str[0..3], str[4..6], str[7..9]],
      [str[0..2], str[3..9]],
      [str[0..6], str[7..9]]
    ]
  end

  # takes an array of string combinations
  # compares teh strings to the dictionary
  # if dictionary contains each string in the array, adds it to final result
  def allocs(pc)
    temp = []
    pc.each do |p|
      if dictionary.include? p
        temp << p
      else
        temp.clear
        break
      end
    end
    @final << temp if temp != []
  end
  
  def valid_number?
    return false if number.nil?

    # remove 0s, 1s and alphabets from the string
    valid_number = number.gsub(/[^2-9]/, '')

    # if there are still 10 numbers after removing 0s and 1s; the number is valid
    return true if valid_number.length == 10

    # return false if number is invalid (since execution reaches this line)
    return false
  end
end
