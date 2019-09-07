class Mapper
  attr_accessor :number

  def initialize(number)
    @number = number
  end
  
  def valid_number?
    return false if number.nil?

    # remove 0 and 1 from the string
    valid_number = number.gsub(/[^2-9]/, '')

    # if there are still 10 numbers after removing 0s and 1s; the number is valid
    return true if valid_number.length == 10

    # return false if number is invalid since execution reaches this lines
    return false
  end
end
