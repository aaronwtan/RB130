# Write a minitest assertion that will fail if the class of value is not Numeric
# or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

class KindTest < Minitest::Test
  def test_is_kind_of_numeric
    value = 42
    assert_kind_of(Numeric, value)
  end
end
