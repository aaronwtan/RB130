# Ruby gives us a lot of flexibility when assigning arrays to variables. If we
# want to assign the entire array to a single variable, we can do that:
birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']

# If we want to assign every element to a separate variable, we can do that too:
# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'

# Suppose we want to organize our array contents into groups,
# where variables represent category names. Can we do that without
# extracting items directly from the array based on their indices?

# We can use the splat operator(*) to do something like this:
# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors # => ['hawk','eagle']

# Based on the examples shown above, write a method that takes an array
# as an argument. The method should yield the contents of the array to a block,
# which should assign your block parameters in such a way that it ignores the
# first two elements, and groups all remaining elements as a raptors array.

def types(birds)
  yield(birds)
end

types(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}" }
