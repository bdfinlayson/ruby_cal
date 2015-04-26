#!/usr/bin/env ruby
#require_relative 'lib/zeller_congruency.rb'
require_relative 'lib/month_checker.rb'

first, second = ARGV

m = Month.new(first, second)
cal_month = m.to_string

#then, print the month
days = %w[Su Mo Tu We Th Fr Sa]
months = %w[January February March April May June July August September October November December]
desired_month = first.to_i - 1
arr = []
print months[desired_month].center(20) + "\n"
cal_month.each_slice(7) { |a| arr << a }
print days.join(' ').center(20) + "\n"
arr.each { |a| print a.join(' ').center(20) + "\n" }


#q = input[0] #day
#m = input[1] #month
#y = input[2] #year

#zeller_congruency(q,m,y)

#output = `cal #{m} #{y}`

#puts output

