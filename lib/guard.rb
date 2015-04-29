require_relative 'month_checker'
require_relative 'year_checker'

def check_cal_values(args)
  first = args[0]
  second = args[1]
  if args.length >= 2
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
      Month.new(first, second).to_string
    end
  else
    Year.new(first).to_string
  end
end


