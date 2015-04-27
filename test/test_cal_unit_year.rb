require_relative 'test_helper'
require_relative '../lib/year_checker'

class TestYear < Minitest::Test

  def test_unit_0a_year_initializes_with_a_year?
    y = Year.new("1804")
    assert_equal "1804", y.year
  end

  def test_unit_1a_year_returns_correct_value_for_leap_year?
    y = Year.new("1804")
    assert_equal true, y.is_leap_year?
  end

  def test_unit_1b_year_returns_correct_value_for_non_leap_year?
    y = Year.new("2003")
    assert_equal false, y.is_leap_year?
  end

end
