# Write a minitest assertion that will fail unless employee.hire
# raises a NoExperienceError exception.

require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionTest < Minitest::Test
  def test_hire_raises_no_experience_error
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end
