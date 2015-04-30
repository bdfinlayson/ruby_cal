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

  def test_integration_month_0b_raises_error_if_month_too_high_is_invalid?
    output = `./cal.rb 13 2015`
    expected = <<EOS
Your input, 13 2015, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

EOS
    assert_equal expected, output
  end

  def test_integration_month_0c_raises_error_if_negative_month_is_invalid?
    output = `./cal.rb -1 2015`
    expected = <<EOS
Your input, -1 2015, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

EOS
    assert_equal expected, output
  end

  def test_integration_month_0d_raises_error_if_month_given_as_string?
    output = `./cal.rb February 2015`
    expected = <<EOS
Your input, February 2015, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

EOS
    assert_equal expected, output
  end

  def test_integration_month_0e_raises_error_if_year_too_high?
    output = `./cal.rb 05 3001`
    expected = <<EOS
Your input, 05 3001, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

EOS
    assert_equal expected, output
  end

  def test_integration_month_0f_raises_error_if_year_too_low?
    output = `./cal.rb 12 1799`
    expected = <<EOS
Your input, 12 1799, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

EOS
    assert_equal expected, output
  end

  def test_integration_month_0g_raises_error_if_negative_year_given?
   output = `./cal.rb 12 -1`
   expected = <<EOS
Your input, 12 -1, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

EOS
   assert_equal expected, output
  end

  def test_integration_month_0h_raises_error_if_year_given_as_string?
    output = `./cal.rb 04 nineteen eighty five`
    expected = <<EOS
Your input, 04 nineteen, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

EOS
    assert_equal expected, output
  end

  def test_integration_1a_throws_error_if_date_is_below_allowable_range?
    output = `./cal.rb 12 1799`
    expected = <<EOS
Your input, 12 1799, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

EOS
    assert_equal expected, output
  end

  def test_integration_1b_throws_error_if_date_is_above_allowable_range?
    output = `./cal.rb 01 3001`
    expected = <<EOS
Your input, 01 3001, contains either an invalid year (years 1800 to 3000) or an invalid month (1 to 12).

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

  def test_integration_3a_outputs_a_year?
    output = `./cal.rb 2010`
    expected = <<EOS
                             2010

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                1  2      1  2  3  4  5  6      1  2  3  4  5  6
 3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13
10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20
17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27
24 25 26 27 28 29 30  28                    28 29 30 31
31
       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
             1  2  3                     1         1  2  3  4  5
 4  5  6  7  8  9 10   2  3  4  5  6  7  8   6  7  8  9 10 11 12
11 12 13 14 15 16 17   9 10 11 12 13 14 15  13 14 15 16 17 18 19
18 19 20 21 22 23 24  16 17 18 19 20 21 22  20 21 22 23 24 25 26
25 26 27 28 29 30     23 24 25 26 27 28 29  27 28 29 30
                      30 31
        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
             1  2  3   1  2  3  4  5  6  7            1  2  3  4
 4  5  6  7  8  9 10   8  9 10 11 12 13 14   5  6  7  8  9 10 11
11 12 13 14 15 16 17  15 16 17 18 19 20 21  12 13 14 15 16 17 18
18 19 20 21 22 23 24  22 23 24 25 26 27 28  19 20 21 22 23 24 25
25 26 27 28 29 30 31  29 30 31              26 27 28 29 30

      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                1  2      1  2  3  4  5  6            1  2  3  4
 3  4  5  6  7  8  9   7  8  9 10 11 12 13   5  6  7  8  9 10 11
10 11 12 13 14 15 16  14 15 16 17 18 19 20  12 13 14 15 16 17 18
17 18 19 20 21 22 23  21 22 23 24 25 26 27  19 20 21 22 23 24 25
24 25 26 27 28 29 30  28 29 30              26 27 28 29 30 31
31
EOS

    assert_equal expected, output
  end

  def test_integration_3b_leap_year_prints_correctly?
    output = `./cal.rb 1804`
    expected = <<EOS
                             1804

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4               1  2  3
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   4  5  6  7  8  9 10
15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17
22 23 24 25 26 27 28  19 20 21 22 23 24 25  18 19 20 21 22 23 24
29 30 31              26 27 28 29           25 26 27 28 29 30 31

       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7         1  2  3  4  5                  1  2
 8  9 10 11 12 13 14   6  7  8  9 10 11 12   3  4  5  6  7  8  9
15 16 17 18 19 20 21  13 14 15 16 17 18 19  10 11 12 13 14 15 16
22 23 24 25 26 27 28  20 21 22 23 24 25 26  17 18 19 20 21 22 23
29 30                 27 28 29 30 31        24 25 26 27 28 29 30

        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4                     1
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   2  3  4  5  6  7  8
15 16 17 18 19 20 21  12 13 14 15 16 17 18   9 10 11 12 13 14 15
22 23 24 25 26 27 28  19 20 21 22 23 24 25  16 17 18 19 20 21 22
29 30 31              26 27 28 29 30 31     23 24 25 26 27 28 29
                                            30
      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6               1  2  3                     1
 7  8  9 10 11 12 13   4  5  6  7  8  9 10   2  3  4  5  6  7  8
14 15 16 17 18 19 20  11 12 13 14 15 16 17   9 10 11 12 13 14 15
21 22 23 24 25 26 27  18 19 20 21 22 23 24  16 17 18 19 20 21 22
28 29 30 31           25 26 27 28 29 30     23 24 25 26 27 28 29
                                            30 31
EOS
    assert_equal output, expected
  end
end
