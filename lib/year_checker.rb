require_relative 'month_checker'

class Year
  attr_accessor :year

  def initialize(year)
    @year = year
  end

  def is_leap_year?
    @year.to_i % 400 == 0 || @year.to_i % 4 == 0 ? true : false
  end

  def parse_year
    @year.split('').drop_while { |x| x.to_i < 1 }.join('')
  end

  def assemble_month_rows(first_month, second_month, third_month)
    first_row = Month.new(first_month, @year).to_a
    second_row = Month.new(second_month, @year).to_a
    third_row = Month.new(third_month, @year).to_a
    mixed_rows = first_row.zip(second_row, third_row)
    mixed_rows.collect{ |x| x.insert(1," ").insert(3," ").join(" ").rstrip}.join("\n")
  end


  def to_string
    body = "#{header}\n\n"
    body << "#{assemble_month_rows(1,2,3)}\n"
    body << "#{assemble_month_rows(4,5,6)}\n"
    body << "#{assemble_month_rows(7,8,9)}\n"
    body << "#{assemble_month_rows(10,11,12)}\n"
  end

  private

  def header
    "#{@year}".center(62).rstrip
  end
end


