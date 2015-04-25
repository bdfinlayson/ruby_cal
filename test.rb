start_day = 0
desired_month = 12 - 1
year = 2001
#count = 0
#arr = []
months = %w[January February March April May June July August September October November December]
days = %w[Su Mo Tu We Th Fr Sa]
default_month = [' 1',' 2',' 3',' 4',' 5',' 6',' 7',' 8',' 9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ']

#first, set the month arr for the correct number of days
if /September|April|June|November/.match(months[desired_month])
  #should remove 31 and add 1 blank space
  month_to_print = default_month.delete_if { |x| /31/.match(x) }
  month_to_print << "  "
elsif /February/.match(months[desired_month])
  #if leap year, remove 31 and 30 and add 2 blank spaces
  #else, remove 31 through 29 and add 3 blank spaces
  if year % 400 == 0
    month_to_print = default_month.delete_if { |x| /31|30/.match(x) }
    2.times do |i|
      month_to_print <<  "  "
    end
  else
    month_to_print = default_month.delete_if { |x| /31|30|29/.match(x) }
    3.times do |i|
      month_to_print << "  "
    end
  end
else
  #use default month arr
  month_to_print = default_month
end

#then, adjust the days:
#if start on saturday, unshift 6 " " and pop 6 " "
#if start on friday, unshift 5 " " and pop 5 " "
#if start on thursday, unshift 4 " " and pop 4 " "
#if start on wednesday, unshift 3 " " and pop 3 " "
#if start on tuesday, unshift 2 " " and pop 2 " "
#if start on monday, unshift 1 " " an pop 1 " "
#if start on sunday, do nothing
if start_day == 0
  6.times do |i|
    month_to_print.unshift("  ").pop
  end
elsif start_day == 6
  5.times do |i|
    month_to_print.unshift("  ").pop
  end
elsif start_day == 5
  4.times do |i|
    month_to_print.unshift("  ").pop
  end
elsif start_day == 4
  3.times do |i|
    month_to_print.unshift("  ").pop
  end
elsif start_day == 3
  2.times do |i|
    month_to_print.unshift("  ").pop
  end
elsif start_day == 2
  1.times do |i|
    month_to_print.unshift("  ").pop
  end
end

#then, print the month
arr = []
print months[desired_month].center(20) + "\n"
month_to_print.each_slice(7) { |a| arr << a }
print days.join(' ').center(20) + "\n"
arr.each { |a| print a.join(' ').center(20) + "\n" }

