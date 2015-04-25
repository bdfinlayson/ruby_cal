start_day = 6
count = 0
arr = []
days = %w[saturday sunday monday tuesday wednesday thrusday friday]
days_rotated = days.rotate(start_day)
day_nums = [[1,2,3,4,5,6,7],[8,9,10,11,12,13,14],[15,16,17,18,19,20,21],[22,23,24,25,26,27,28],[29,30,31,nil,nil,nil,nil]]
days_arr = day_nums.transpose
while count < 7
  arr << days_arr[count].unshift(days_rotated[count])
  start_day += 1
  count += 1
end
print arr
