# In the previous exercise, you developed a method called any? that is similar
# to the standard Enumerable#any? method for Arrays (our actual solution works
# with any Enumerable collection). In this exercise, you will develop
# its companion, all?.

# Enumerable#all? processes elements in a collection by passing
# each element value to a block that is provided in the method call.
# If the block returns a truthy value for every element,
# then #all? returns true. Otherwise, #all? returns false. Note in particular
# that #all? will stop searching the collection the first time the block
# returns false.

# Write a method called all? that behaves similarly for Arrays.
# It should take an Array as an argument, and a block. It should return true
# if the block returns true for all of the element values. Otherwise,
# it should return false.

# Your method should stop processing elements of the Array as soon
# as the block returns false.

# If the Array is empty, all? should return true, regardless
# of how the block is defined.

# Your method may not use any standard Ruby method that is named all?,
# any?, none?, or one?.

def all?(array)
  array.each { |element| return false unless yield(element) }
  true
end

# Examples:
puts all?([1, 3, 5, 6]) { |value| value.odd? } == false
puts all?([1, 3, 5, 7]) { |value| value.odd? } == true
puts all?([2, 4, 6, 8]) { |value| value.even? } == true
puts all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts all?([1, 3, 5, 7]) { |value| true } == true
puts all?([1, 3, 5, 7]) { |value| false } == false
puts all?([]) { |value| false } == true
