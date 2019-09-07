class Mapper
  attr_accessor :number

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
  end

  # returns a 2d array with equivalent characters for the input number
  def number_to_string
    number.chars.map {|n| @number_map[n]}
  end
  
  def valid_number?
    return false if number.nil?

    # remove 0 and 1 and alphabets from the string
    valid_number = number.gsub(/[^2-9]/, '')

    # if there are still 10 numbers after removing 0s and 1s; the number is valid
    return true if valid_number.length == 10

    # return false if number is invalid (since execution reaches this line)
    return false
  end
end
