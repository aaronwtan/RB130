# Write a minitest assertion that will fail if the value.odd? is not true.
require 'minitest/autorun'

class BooleanTest < Minitest::Test
  def test_odd_question
    value = 3
    assert_equal(true, value.odd?, 'value is not odd')
  end
end
