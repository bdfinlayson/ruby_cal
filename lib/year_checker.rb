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
end


