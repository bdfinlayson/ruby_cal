#!/usr/bin/env ruby
require_relative 'lib/month_checker.rb'
require_relative 'lib/month_checker.rb'
require_relative 'lib/input_parser.rb'

def leading_zeros_remover(num)
  num.split('').drop_while { |x| x == "0" }.join('')
end

input = ARGV
orig_input = []
input.each { |x| orig_input << x }

input[1] = leading_zeros_remover(input[1]) unless input[1].nil?
input[0] = leading_zeros_remover(input[0]) unless input[0].nil?

parser = Input_Parser.new(input)

WARNING = "Your input, #{orig_input[0]}#{' '+ orig_input[1] if parser.check_input_has_two_args?}, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).\n\n"

if parser.find_problem_with_year?
  print WARNING
  exit
end


if parser.find_problem_with_month?
  print WARNING
  exit
end

if parser.determine_a_month_should_be_printed?
  month = Month.new(input[0],input[1]).to_string
  print month
  exit
end

if parser.determine_year_should_be_printed?
  year = Year.new(input[0]).to_string
  print year
  exit
end





