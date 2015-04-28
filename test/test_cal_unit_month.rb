require_relative 'test_helper'
require_relative '../lib/month_checker'

class TestMonth < Minitest::Test


  def test_unit_month_0a_initializing_a_month_saves_values?
    m = Month.new("05", "2015")
    assert_equal "05", m.month
    assert_equal "2015", m.year
  end

  def test_unit_month_1a_responds_to_s_method?
    m = Month.new("02", "2015")
    assert_equal true, m.respond_to?(:to_string)
  end

  def test_unit_month_1b_initializes_day_with_zeller?
    m = Month.new("02", "2000")
    assert_equal 3, m.day
  end

  def test_unit_month_1c_initializes_leap_year_with_Year_class?
    m = Month.new("04", "1804")
    assert_equal true, m.is_leap_year
  end

  def test_unit_month_1d_initializes_when_passed_month_values_with_leading_zeroes?
    m = Month.new("00004", "1804")
    assert_equal 4, m.month.to_i
  end

  def test_unit_month_1e_initializes_when_passed_year_values_with_leading_zeroes?
    m = Month.new("0000004", "00000001804")
    assert_equal "1804", m.year
  end
end
