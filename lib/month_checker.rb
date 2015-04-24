class Month
  require_relative 'zeller_congruency'
  attr_reader :month, :year
  MONTHS = %w[january february march april may june july august september october november december]

  def initialize(input)
    @month = input[0]
    @year = input[1]
    @day = zeller_congruency(01,@month,@year) 
    puts "#{@day} from zeller to month class"
  end

  def name

  end

  def to_s
    <<EOS
    January 2017
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
  end

end
