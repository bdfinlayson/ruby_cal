require_relative 'month_checker'
require_relative 'year_checker'

class Input_Parser

  def initialize(*input)
    @first = input[0][0]
    @second = input[0][1]
  end

  def check_input_has_one_arg?
    true if @second.nil?
  end

  def check_input_has_two_args?
   true if !@second.nil?
  end

  def check_if_second_input_is_invalid_year?
    true if @second.to_i > 3000 || @second.to_i < 1800 || /\D/.match(@second)
  end

  def check_if_second_input_has_word_chars?
    true if /\D/.match(@second) && !/-/.match(@second)
  end

  def check_if_first_input_is_invalid_month?
    true if @first.to_i > 12 || @first.to_i < 1 || /\D/.match(@first)
  end

  def check_if_first_input_is_invalid_year?
    true if @first.to_i > 3000 || @first.to_i < 1800 || /\D/.match(@first)
  end

  def check_if_first_input_has_word_chars?
    true if /\D/.match(@first) || /-/.match(@first)
  end

  def find_problem_with_year?
    if (check_input_has_one_arg?) && check_if_first_input_is_invalid_year? || check_if_first_input_has_word_chars?
      true
    elsif (check_input_has_two_args?) && check_if_second_input_is_invalid_year? || check_if_second_input_has_word_chars?
      true
    else
      false
    end
  end

  def find_problem_with_month?
    if (check_input_has_two_args?) && check_if_first_input_is_invalid_month? || check_if_first_input_has_word_chars?
      true
    else
      false
    end
  end

  def determine_year_should_be_printed?
    if (check_input_has_one_arg?) && (find_problem_with_year? == false)
      true
    else
      false
    end
  end

  def determine_a_month_should_be_printed?
    if (check_input_has_two_args?) && (find_problem_with_month? == false)
      true
    else
      false
    end
  end
end
