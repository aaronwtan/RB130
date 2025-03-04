# In the previous 3 exercises, you developed methods called
# any?, all?, and none? that are similar to the standard Enumerable methods
# of the same names. In this exercise, you will develop one last method
# from this family, one?.

# Enumerable#one? processes elements in a collection by passing
# each element value to a block that is provided in the method call.
# If the block returns a truthy value for exactly one element,
# then #one? returns true. Otherwise, #one? returns false. Note in particular
# that #one? will stop searching the collection the second time
# the block returns true.

# Write a method called one? that behaves similarly for Arrays.
# It should take an Array as an argument, and a block. It should return true
# if the block returns true for exactly one of the element values. Otherwise,
# it should return false.

# Your method should stop processing elements of the Array as soon
# as the block returns true a second time.

# If the Array is empty, one? should return false, regardless
# of how the block is defined.

# Your method may not use any standard Ruby method that is named
# all?, any?, none?, or one?.

def one?(array)
  true_count = 0

  array.each do |element|
    true_count += 1 if yield(element)
    return false if true_count > 1
  end

  true_count == 1
end

# Examples:
puts one?([1, 3, 5, 6]) { |value| value.even? }    == true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     == false
puts one?([2, 4, 6, 8]) { |value| value.even? }    == false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
puts one?([1, 3, 5, 7]) { |value| true }           == false
puts one?([1, 3, 5, 7]) { |value| false }          == false
puts one?([]) { |value| true }                     == false
