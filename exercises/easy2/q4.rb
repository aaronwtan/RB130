# NOTE: This exercise was originally a duplicate from the previous exercise set.
# We have modified it slightly, but some of the posted solutions still reflect
# the original wording.

# The Enumerable#count method iterates over the members of a collection,
# passing each element to the associated block. It then returns the number
# of elements for which the block returns a truthy value.

# Write a method called count that behaves similarly
# for an arbitrarily long list of arguments. It should take
# 0 or more arguments and a block, and then return the total number
# of arguments for which the block returns true.

# If the argument list is empty, count should return 0.

# Your method may use #each, #each_with_object, #each_with_index, #reduce,
# loop, for, while, or until to iterate through the Array passed in
# as an argument, but must not use any other methods that iterate
# through an Array or any other collection.

def count(*args)
  counter = 0
  args.each { |arg| counter += 1 if yield(arg) }
  counter
end

# Examples:
p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
