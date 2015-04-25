start_day = 1
desired_month = 1
#count = 0
#arr = []
months = %w[January February March April May June July August September October November December]
days = %w[Su Mo Tu We Th Fr Sa]
#cal_days = %w[Su Mo Tu We Th Fr Sa]
#days_rotated = days.rotate(start_day)
#day_nums = [[1,2,3,4,5,6,7],[8,9,10,11,12,13,14],[15,16,17,18,19,20,21],[22,23,24,25,26,27,28],[29,30,31,nil,nil,nil,nil]]
#days_arr = day_nums.transpose
#while count < 7
#  arr << days_arr[count].unshift(days_rotated[count])
#  start_day += 1
#  count += 1
#end


arr = []
#default_month = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
print months[desired_month].center(20) + "\n"
default_month = [' 1',' 2',' 3',' 4',' 5',' 6',' 7',' 8',' 9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ']
default_month.each_slice(7) { |a| arr << a }
print days.join(' ').center(20) + "\n"
arr.each { |a| print a.join(' ').center(20) + "\n" }



#row1 << cal_days
#print row1.join(' ')
#print arr
#x = days_rotated.zip(days_arr)
#print x
