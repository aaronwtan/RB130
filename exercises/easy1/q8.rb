# In the previous two exercises, you developed methods called any? and all?
# that are similar to the standard Enumerable methods with the same names.
# In this exercise, you will develop another of the methods
# in this family, none?.

# Enumerable#none? processes elements in a collection by passing
# each element value to a block that is provided in the method call.
# If the block returns true for any element, then #none? returns false.
# Otherwise, #none? returns true. Note in particular that #none?
# will stop searching the collection the first time the block returns true.

# Write a method called none? that behaves similarly for Arrays.
# It should take an Array as an argument, and a block. It should return true
# if the block returns false for all of the element values. Otherwise,
# it should return false.

# Your method should stop processing elements of the Array as soon
# as the block returns true.

# If the Array is empty, none? should return true, regardless
# of how the block is defined.

# Your method may not use any of the following methods
# from the Array and Enumerable classes: all?, any?, none?, one?.
# You may, however, use either of the methods created
# in the previous two exercises.

def none?(array)
  array.each { |element| return false if yield(element) }
  true
end

# Examples:
puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true

def any?(array)
  array.each { |element| return true if yield(element) }
  false
end

def none_with_any?(array, &block)
  !any?(array, &block)
end

puts none_with_any?([1, 3, 5, 6]) { |value| value.even? } == false
puts none_with_any?([1, 3, 5, 7]) { |value| value.even? } == true
puts none_with_any?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none_with_any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none_with_any?([1, 3, 5, 7]) { |value| true } == false
puts none_with_any?([1, 3, 5, 7]) { |value| false } == true
puts none_with_any?([]) { |value| true } == true

def all?(array)
  array.each { |element| return false unless yield(element) }
  true
end

def none_with_all?(array)
  all?(array) { |element| !yield(element) }
end

puts none_with_all?([1, 3, 5, 6]) { |value| value.even? } == false
puts none_with_all?([1, 3, 5, 7]) { |value| value.even? } == true
puts none_with_all?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none_with_all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none_with_all?([1, 3, 5, 7]) { |value| true } == false
puts none_with_all?([1, 3, 5, 7]) { |value| false } == true
puts none_with_all?([]) { |value| true } == true
