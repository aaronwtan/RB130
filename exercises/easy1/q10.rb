# Write a method that takes an array as an argument, and a block
# that returns true or false depending on the value of the array element
# passed to it. The method should return a count of the number of times
# the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

def count(array)
  counter = 0
  array.each { |element| counter += 1 if yield(element) }
  counter
end

# Examples:
puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Further Exploration
# Write a version of the count method that meets the conditions
# of this exercise, but also does not use each, loop, while, or until.

def count2(array, &block)
  array.select(&block).size
end

puts count2([1,2,3,4,5]) { |value| value.odd? } == 3
puts count2([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count2([1,2,3,4,5]) { |value| true } == 5
puts count2([1,2,3,4,5]) { |value| false } == 0
puts count2([]) { |value| value.even? } == 0
puts count2(%w(Four score and seven)) { |value| value.size == 5 } == 2

def recursive_count(array, &block)
  return 0 if array.empty?
  yield(array.shift) ? recursive_count(array, &block) + 1 : recursive_count(array, &block)
end

puts recursive_count([1,2,3,4,5]) { |value| value.odd? } == 3
puts recursive_count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts recursive_count([1,2,3,4,5]) { |value| true } == 5
puts recursive_count([1,2,3,4,5]) { |value| false } == 0
puts recursive_count([]) { |value| value.even? } == 0
puts recursive_count(%w(Four score and seven)) { |value| value.size == 5 } == 2
