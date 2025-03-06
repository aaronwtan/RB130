# Write a minitest assertion that will fail if the 'xyz'
# is not in the Array list.

require 'minitest/autorun'

class IncludedObjectTest < Minitest::Test
  def test_array_includes_xyz
    list = [1, nil, 'xyz']
    assert_includes(list, 'xyz')
  end
end
