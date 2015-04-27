require_relative 'test_helper'
require_relative '../lib/zeller_congruency'

class TestZellerCongruency < Minitest::Test

DAYS = {
  0 => "Saturday",
  1 => "Sunday",
  2 => "Monday",
  3 => "Tuesday",
  4 => "Wednesday",
  5 => "Thursday",
  6 => "Friday"
}

  def test_unit_zeller_0a_throws_error_when_passed_too_few_arguments?
    assert_raises ArgumentError do
      zeller_congruency(01,2000)
    end
  end

  #def test_unit_zeller_0b_can_accept_any_number_of_leading_zeros_in_all_three_args?
  #  day = zeller_congruency(00000001,00000001,000000001844)
  #  assert_equal 1, day
  #end


  def test_unit_zeller_1a_returns_Sunday_for_Jan_1804_leap_year?
    day = zeller_congruency(01,01,1804)
    assert_equal 1, day
  end

  def test_unit_zeller_1b_return_Wednesday_for_Feb_1804_leap_year?
    day = zeller_congruency(01,02,1804)
    assert_equal 4, day
  end

  def test_unit_zeller_1c_return_Thursday_for_March_1804_leap_year?
    day = zeller_congruency(01,03,1804)
    assert_equal 5, day
  end

  def test_unit_zeller_1d_return_Sunday_for_April_1804_leap_year?
    day = zeller_congruency(01,04,1804)
    assert_equal 1, day
  end

  def test_unit_zeller_1e_return_Tuesday_for_May_1804_leap_year?
    day = zeller_congruency(01,05,1804)
    assert_equal 3, day
  end

  def test_unit_zeller_2a_return_Saturday_for_January_2000_leap_year?
    day = zeller_congruency(01,01,2000)
    assert_equal 0, day
  end

  def test_unit_zeller_2b_return_Tuesday_for_February_2000_leap_year?
    day = zeller_congruency(01,02,2000)
    assert_equal 3, day
  end

  def test_unit_zeller_2c_return_Wednesday_for_March_2000_leap_year?
    day = zeller_congruency(01,03,2000)
    assert_equal 4, day
  end

  def test_unit_zeller_2d_return_Saturday_for_April_2000_leap_year?
    day = zeller_congruency(01,04,2000)
    assert_equal 0, day
  end

  def test_unit_zeller_2e_return_Friday_for_December_2000_leap_year?
    day = zeller_congruency(01,12,2000)
    assert_equal 6, day
  end

  def test_unit_zeller_3a_return_Monday_for_December_3000?
    day = zeller_congruency(01,12,3000)
    assert_equal 2, day
  end

  def test_unit_zeller_4a_return_Wednesday_for_January_1800?
    day = zeller_congruency(01,01,1800)
    assert_equal 4, day
  end

  def test_unit_zeller_4b_return_Saturday_for_February_1800?
    day = zeller_congruency(01,02,1800)
    assert_equal 0, day
  end

  def test_unit_zeller_4c_return_Saturday_for_March_1800?
    day = zeller_congruency(01,03,1800)
    assert_equal 0, day
  end

  def test_unit_zeller_5a_return_Monday_for_January_1900?
    day = zeller_congruency(01,01,1900)
    assert_equal 2, day
  end

  def test_unit_zeller_5b_return_Thursday_for_February_1900?
    day = zeller_congruency(01,02,1900)
    assert_equal 5, day
  end

  def test_unit_zeller_5b_return_Thursday_for_March_1900?
    day = zeller_congruency(01,03,1900)
    assert_equal 5, day
  end

  def test_unit_zeller_5c_return_Saturday_for_December_1900?
    day = zeller_congruency(01,12,1900)
    assert_equal 0, day
  end
end
