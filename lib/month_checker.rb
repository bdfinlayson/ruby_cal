class Month
  require_relative 'year_checker'
  require_relative 'zeller_congruency'
  attr_reader :month, :year, :day, :is_leap_year
  MONTHS = %w[January February March April May June July August September October November December]
  DAYS = %w[Su Mo Tu We Th Fr Sa]

  def initialize(first, second)
    @month = first
    @year = year_parser(second)
    @start_day = start_day
    @is_leap_year = month_is_in_leap_year?
  end

  def start_day
    zeller_congruency(01,@month,@year)
  end

  def month_is_in_leap_year?
    y = Year.new(@year)
    y.is_leap_year?
  end

  def year_parser(second)
    year = Year.new(second)
    year.parse_year
  end

  def month_finder
    MONTHS[@month.to_i - 1]
  end

  def make_header
    header = month_finder + " " + @year
    header.center(20).rstrip #+ "\n"
  end

  def make_days
    DAYS.join(' ').center(20) #+ "\n"
  end

  def make_weeks
    arr = []
    default_month = [' 1',' 2',' 3',' 4',' 5',' 6',' 7',' 8',' 9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ']

    if /September|April|June|November/.match(month_finder)
      month_to_print = default_month.delete_if { |x| /31/.match(x) }
      month_to_print << "  "
    elsif /February/.match(month_finder)
      if @is_leap_year
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
      month_to_print = default_month
    end

    if @start_day == 0
      6.times do |i|
        month_to_print.unshift("  ").pop
      end
    elsif @start_day == 6
      5.times do |i|
        month_to_print.unshift("  ").pop
      end
    elsif @start_day == 5
      4.times do |i|
        month_to_print.unshift("  ").pop
      end
    elsif @start_day == 4
      3.times do |i|
        month_to_print.unshift("  ").pop
      end
    elsif @start_day == 3
      2.times do |i|
        month_to_print.unshift("  ").pop
      end
    elsif @start_day == 2
      1.times do |i|
        month_to_print.unshift("  ").pop
      end
    end

    weeks = ""
    month_to_print.each_slice(7) { |a| arr << a }
    arr.each { |a|  weeks << a.join(' ').center(20).rstrip + "\n" }
    weeks
  end

  def to_string
    month =
"#{make_header}
#{make_days}
#{make_weeks}"

    month
  end

end
