require_relative 'test_helper'
require_relative '../lib/month'

class TestMonth < Minitest::Test

  def test_unit_month_0a_initializing_a_month_saves_values?
    m = Month.new(05, 2015)
    assert_equal 05, m.month
    assert_equal 2015, m.year
  end

  def test_unit_month_0b_raises_error_if_month_too_high_is_invalid?
    m = Month.new
    assert_raises ArgumentError do
      m.push(13, 2015)
    end
  end

  def test_unit_month_0c_raises_error_if_negative_month_is_invalid?
    m = Month.new
    assert_raises ArgumentError do
      m.push(-1, 2015)
    end
  end

  def test_unit_month_0d_raises_error_if_month_given_as_string?
    m = Month.new
    assert_raises ArgumentError do
      m.push("February", 2015)
    end
  end

  def test_unit_month_1a_responds_to_s_method?
    m = Month.new(02, 2015)
    assert_equal true, m.respond_to?(:to_s)
  end

end
