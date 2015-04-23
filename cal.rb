#!/usr/bin/env ruby

input = ARGV

q = input[0] #day
m = input[1] #month
y = input[2] #year

output = `cal #{m} #{y}`

puts output

def zeller_congruency(q,m,y)
  q = q.to_i
  m = m.to_i
  y = y.to_i



  if m < 3
    m += 12
    y -= 1
  end

  h = q + 13*(m+1)/5 + y%100 + y%100/4 + y/100/4 - 2*y/100

  return h % 7
end

# h is the day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
# q is the day of the month
# m is the month (3 = March, 4 = April, 5 = May, ..., 14 = February)
# K the year of the century (year \mod 100).
# J is the zero-based century (actually \lfloor year/100 \rfloor) For example, the zero-based centuries for 1995 and 2000 are 19 and 20 respectively (to not be confused with the common ordinal century enumeration which indicates 20th for both cases).
