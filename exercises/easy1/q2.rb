# Write a method that takes an optional block. If the block is specified,
# the method should execute it, and return the value returned by the block.
# If no block is specified, the method should simply return the String 'Does not compute.'.

def compute
  block_given? ? yield : 'Does not compute.'
end

# Examples:
p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration
# Modify the compute method so it takes a single argument and yields that argument
# to the block. Provide at least 3 examples of calling this new version of compute,
# including a no-block call.
def compute2(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute2(1) { |num| 5 + 3 + num } == 9
p compute2('c') { |letter| 'a' + 'b' + letter } == 'abc'
p compute2('hello world') == 'Does not compute.'
