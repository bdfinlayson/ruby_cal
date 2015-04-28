#!/usr/bin/env ruby
require_relative 'lib/month_checker.rb'
require_relative 'lib/month_checker.rb'

first, second = ARGV

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
    m = Month.new(first, second)
    cal_month = m.to_string
  end
else
  m = Year.new(first)
  cal_month = m.to_string
end

#then, print the month
days = %w[Su Mo Tu We Th Fr Sa]
months = %w[January February March April May June July August September October November December]
desired_month = first.to_i - 1
arr = []

s = months[desired_month] + " " + m.year
print s.center(20).rstrip + "\n"
cal_month.each_slice(7) { |a| arr << a }
print days.join(' ').center(20) + "\n"
arr.each { |a| print a.join(' ').center(20).rstrip + "\n" }


