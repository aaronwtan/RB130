# Let's return to implementing existing core Ruby methods to learn about blocks.

# The Enumerable#map method iterates over the members of a collection,
# using the associated block to perform some sort of operation
# on each collection member. The returned values from the block
# are then built up into an Array that is then returned to the caller.
# Note in particular that every time #map yields to the block,
# it obtains just one value. That value may be a complex value -
# it may even be another collection - but it is nevertheless just one value.
# Thus, #map returns an Array that has the same number of elements
# that the original collection had.

# Write a method called map that behaves similarly for Arrays.
# It should take an Array as an argument, and a block. It should
# return a new Array that contains the return values produced by the block
# for each element of the original Array.

# If the Array is empty, map should return an empty Array,
# regardless of how the block is defined.

# Your method may use #each, #each_with_object, #each_with_index,
# reduce, loop, for, while, or until to iterate through the Array
# passed in as an argument, but must not use any other methods
# that iterate through an Array or any other collection.

def map(arr)
  result = []
  arr.each { |el| result << yield(el) }
  result
end

# Examples:
p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
puts map({ a: 1, b: 2, c: 3 }) { |k, v| "Key: #{k}, Value: #{v}" }
