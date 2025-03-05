# The Enumerable#max_by method iterates over the members of a collection,
# passing each element to the associated block. It then returns the element
# for which the block returned the largest value.

# Write a method called max_by that behaves similarly for Arrays.
# It should take an Array and a block, and return the element
# that contains the largest value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object, #each_with_index, #reduce,
# loop, for, while, or until to iterate through the Array passed in
# as an argument, but must not use any other methods that iterate
# through an Array or any other collection.

def max_by(arr)
  return nil if arr.empty?

  max_element = arr.first

  arr[1..-1].each do |el|
    max_element = el if yield(el) > yield(max_element)
  end

  max_element
end

# Examples:
p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
