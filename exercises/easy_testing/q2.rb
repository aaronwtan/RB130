# Write a minitest assertion that will fail if value.downcase
# does not return 'xyz'.

require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_downcase_returns_xyz
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end
