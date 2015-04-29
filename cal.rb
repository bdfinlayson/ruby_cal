#!/usr/bin/env ruby
require_relative 'lib/month_checker.rb'
require_relative 'lib/month_checker.rb'

first, second = ARGV

#refactor as guard class
if ARGV.length >= 2
  if (first && second) && (second.to_i > 3000 || second.to_i < 1800 || /\D/.match(second))
    if /\D/.match(second) && !/-/.match(second)
      print "Enter years in number format YYYY, please.\n\n"
      exit
    else
      print "Year #{second} not in range 1800...3000\n\n"
      exit
    end
    #2 args: if month is invalid, error out
  elsif (first && second) && (first.to_i > 12 || first.to_i < 1 || /\D/.match(first))
    if /\D/.match(first) && !/-/.match(first)
      print "Month numbers only, please.\n\n"
      exit
    else
      print "#{first} is an invalid month.\n\n"
      exit
    end
  else
    cal_month = Month.new(first, second).to_string
  end
else
  cal_year = Year.new(first).to_string
end

print cal_year
print cal_month

