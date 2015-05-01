require_relative 'test_helper'

def unix_whitespace_eliminator lines
  output = ""
  lines.each_line do |line|
    output.concat(line.rstrip + "\n")
  end
  return output
end

def random_year_generator
  rand(1800..3000)
end

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

  def test_integration_4a_program_exits_normally_on_invalid_input_true?
    shell_output = `./cal.rb 00 1800`
    assert_equal(true, $?.exited?)
  end

  def test_integration_4b_program_exits_normally_on_valid_input_true?
    shell_output = `./cal.rb 10 1800`
    assert_equal(true, $?.exited?)
  end

  def test_integration_5a_unix
    expected_output = unix_whitespace_eliminator `cal 1 2000`
    assert_equal(expected_output, `./cal.rb 1 2000`)
  end

  def test_integration_5b_unix
    expected_output = unix_whitespace_eliminator `cal 2 2000`
    assert_equal(expected_output, `./cal.rb 2 2000`)
  end

  def test_integration_5c_unix
    expected_output = unix_whitespace_eliminator `cal 3 2000`
    assert_equal(expected_output, `./cal.rb 3 2000`)
  end

  def test_integration_5d_unix
    expected_output = unix_whitespace_eliminator `cal 4 2000`
    assert_equal(expected_output, `./cal.rb 4 2000`)
  end

  def test_integration_5e_unix
    expected_output = unix_whitespace_eliminator `cal 5 2000`
    assert_equal(expected_output, `./cal.rb 5 2000`)
  end

  def test_integration_5f_unix
    expected_output = unix_whitespace_eliminator `cal 6 2000`
    assert_equal(expected_output, `./cal.rb 6 2000`)
  end

  def test_integration_5g_unix
    expected_output = unix_whitespace_eliminator `cal 7 2000`
    assert_equal(expected_output, `./cal.rb 7 2000`)
  end

  def test_integration_5h_unix
    expected_output = unix_whitespace_eliminator `cal 8 2000`
    assert_equal(expected_output, `./cal.rb 8 2000`)
  end

  def test_integration_5i_unix
    expected_output = unix_whitespace_eliminator `cal 9 2000`
    assert_equal(expected_output, `./cal.rb 9 2000`)
  end

  def test_integration_5j_unix
    expected_output = unix_whitespace_eliminator `cal 10 2000`
    assert_equal(expected_output, `./cal.rb 10 2000`)
  end

  def test_integration_5k_unix
    expected_output = unix_whitespace_eliminator `cal 11 2000`
    assert_equal(expected_output, `./cal.rb 11 2000`)
  end

  def test_integration_5l_unix
    expected_output = unix_whitespace_eliminator `cal 12 2000`
    assert_equal(expected_output, `./cal.rb 12 2000`)
  end

  def test_integration_6a_unix
    expected_output = unix_whitespace_eliminator `cal 1950`
    assert_equal(expected_output, `./cal.rb 1950`)
  end
  def test_integration_6b_unix
    expected_output = unix_whitespace_eliminator `cal 1920`
    assert_equal(expected_output, `./cal.rb 1920`)
  end

  def test_integration_6c_unix
    expected_output = unix_whitespace_eliminator `cal 1900`
    assert_equal(expected_output, `./cal.rb 1900`)
  end

  def test_integration_6d_unix
    expected_output = unix_whitespace_eliminator `cal 1890`
    assert_equal(expected_output, `./cal.rb 1890`)
  end

  def test_integration_6e_unix
    expected_output = unix_whitespace_eliminator `cal 1880`
    assert_equal(expected_output, `./cal.rb 1880`)
  end

  def test_integration_6f_unix
    expected_output = unix_whitespace_eliminator `cal 1830`
    assert_equal(expected_output, `./cal.rb 1830`)
  end

  def test_integration_6g_unix
    expected_output = unix_whitespace_eliminator `cal 1816`
    assert_equal(expected_output, `./cal.rb 1816`)
  end

  def test_integration_6h_unix
    expected_output = unix_whitespace_eliminator `cal 1808`
    assert_equal(expected_output, `./cal.rb 1808`)
  end

  def test_integration_6i_unix
    expected_output = unix_whitespace_eliminator `cal 1804`
    assert_equal(expected_output, `./cal.rb 1804`)
  end

  def test_integration_6j_unix
    expected_output = unix_whitespace_eliminator `cal 1808`
    assert_equal(expected_output, `./cal.rb 1808`)
  end

  def test_integration_6k_unix
    expected_output = unix_whitespace_eliminator `cal 1812`
    assert_equal(expected_output, `./cal.rb 1812`)
  end

  def test_integration_6l_unix
    expected_output = unix_whitespace_eliminator `cal 1816`
    assert_equal(expected_output, `./cal.rb 1816`)
  end

  def test_integration_6m_unix
    expected_output = unix_whitespace_eliminator `cal 2 1900`
    assert_equal(expected_output, `./cal.rb 2 1900`)
  end

  def test_random_year_1
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end


  def test_random_year_2
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_3
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end 

  def test_random_year_4
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_5
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_6
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_7
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_8
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_9
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_10
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_11
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_12
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_13
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_14
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_15
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_16
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_17
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_18
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_19
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_20
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_21
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_22
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_23
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_24
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end


  def test_random_year_25
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end


  def test_random_year_26
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end


  def test_random_year_27
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end


  def test_random_year_28
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end


  def test_random_year_29
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end


  def test_random_year_30
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end


  def test_random_year_31
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

  def test_random_year_32
    random_year = random_year_generator
    expected_output = unix_whitespace_eliminator `cal #{random_year}`
    assert_equal(expected_output, `./cal.rb #{random_year}`)
  end

end
