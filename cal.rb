#!/usr/bin/env ruby

input = ARGV

q = input[0] #day
m = input[1] #month
y = input[2] #year

output = `cal #{m} #{y}`

