#!/usr/bin/env ruby
#require_relative 'lib/zeller_congruency.rb'
require_relative 'lib/month_checker.rb'

input = ARGV



q = input[0] #day
m = input[1] #month
y = input[2] #year

zeller_congruency(q,m,y)

#output = `cal #{m} #{y}`

#puts output

