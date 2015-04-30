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
    arr_of_weeks = []
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
    elsif [6,5,4,3,2].include?(@start_day)
      num = @start_day -= 1
      num.times do |i|
        month_to_print.unshift("  ").pop
      end
    else
      month_to_print = default_month
    end

    month_to_print.each_slice(7) { |a| arr_of_weeks << a }
    arr_of_weeks
  end

  def to_a
    body = []
    body << "#{month_finder}".center(20)
    body << "#{make_days}"
    body.concat(make_weeks)
  end

  def to_string
    weeks = ""
    arr_of_weeks = make_weeks
    arr_of_weeks.each { |a|  weeks << a.join(' ').center(20).rstrip + "\n" }

    "#{make_header}\n#{make_days}\n#{weeks}"
  end
end
