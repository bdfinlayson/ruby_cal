require_relative 'test_helper'
require_relative '../lib/month_checker'

class TestMonth < Minitest::Test


  def test_unit_month_0a_initializing_a_month_saves_values?
    m = Month.new("05", "2015")
    assert_equal "05", m.month
    assert_equal "2015", m.year
  end

  def test_unit_month_0b_raises_error_if_month_too_high_is_invalid?
    assert_raises ArgumentError do
      Month.new("13", "2015")
    end
  end

  def test_unit_month_0c_raises_error_if_negative_month_is_invalid?
    assert_raises ArgumentError do
    Month.new("-1", "2015")
    end
  end

  def test_unit_month_0d_raises_error_if_month_given_as_string?
    assert_raises ArgumentError do
    Month.new("February", 2015)
    end
  end

  def test_unit_month_0e_raises_error_if_year_too_high?
    assert_raises ArgumentError do
    Month.new("05", "3001")
    end
  end

  def test_unit_month_0f_raises_error_if_year_too_low?
    assert_raises ArgumentError do
    Month.new("12", "1799")
    end
  end

  def test_unit_month_0g_raises_error_if_negative_year_given?
   assert_raises ArgumentError do
   Month.new("12", "-1")
   end
  end

  def test_unit_month_0h_raises_error_if_year_given_as_string?
   assert_raises ArgumentError do
   Month.new("04", "nineteen eighty five")
   end
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

end
