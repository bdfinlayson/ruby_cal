#!/usr/bin/env ruby
require_relative 'lib/month_checker.rb'
require_relative 'lib/month_checker.rb'

first, second = ARGV

if ARGV.length == 2
  m = Month.new(first, second)
  cal_month = m.to_string
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


