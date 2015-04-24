require_relative 'test_helper'

class TestCalIntegration < Minitest::Test

  def test_integration_0a_cal_working?
    output = `./cal.rb 01 2012`
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, output
  end

  def test_integration_1a_throws_error_if_date_is_below_allowable_range?
    output = `./cal.rb 12 1799`
    expected = <<EOS
Year 1799 not in range 1800...3000

EOS
    assert_equal expected, output
  end

  def test_integration_1b_throws_error_if_date_is_above_allowable_range?
    output = `./cal.rb 01 3001`
    expected = <<EOS
Year 3001 not in range 1800...3000

EOS
    assert_equal expected, output
  end

  def test_integration_1c_returns_correct_month_for_input_one_month_above_range_lower_threshold?
    output = `./cal.rb 01 1800`
    expected = <<EOS
    January 1800
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_integration_1d_returns_correct_month_for_input_one_month_below_range_upper_threshold?
    output = `./cal.rb 12 3000`
    expected = <<EOS
   December 3000
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_integration_2a_leap_year_2000_returns_correct_value_for_february?
    output = `./cal.rb 02 2000`
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
    assert_equal expected, output
  end

  def test_integration_2b_leap_year_1804_returns_correct_value_for_february?
    output = `./cal.rb 02 1804`
    expected = <<EOS
   February 1804
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29

EOS
    assert_equal expected, output
  end

  def test_integration_2c_leap_year_2296_returns_correct_value_for_february?
    output = `./cal.rb 02 2296`
    expected = <<EOS
   February 2296
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29

EOS
    assert_equal expected, output
  end
end
