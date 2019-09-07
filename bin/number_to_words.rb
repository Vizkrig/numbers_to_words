#!/usr/bin/env ruby
# encoding: utf-8

$:.unshift(File.expand_path('../lib', File.dirname(__FILE__)))
require 'mapper.rb'

number = Mapper.new('6686787825')
p number.valid_number?
