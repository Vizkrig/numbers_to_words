#!/usr/bin/env ruby
# encoding: utf-8

$:.unshift(File.expand_path('../lib', File.dirname(__FILE__)))
require 'mapper.rb'

parameters = ARGV

begin
  map_obj = Mapper.new(parameters[0])
  if map_obj.valid_number?
    puts map_obj.convert.map{|f| f.join(',')}
  else
    raise "#{parameters[0]} is an invalid input"
  end
rescue => e
  puts e.message
  puts
  puts 'Avoid 0s, 1s or characters in the input'
  puts 'Length of input should be 10 digits'
  puts 'Please try again'
  puts
end
