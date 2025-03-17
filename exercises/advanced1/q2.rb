# For this exercise, we'll be learning and practicing our knowledge
# of the arity of lambdas, procs, and implicit blocks. Two groups of code
# also deal with the definition of a Proc and a Lambda, and the differences
# between the two. Run each group of code below: For your answer
# to this exercise, write down your observations for each group of code.
# After writing out those observations, write one final analysis
# that explains the differences between procs, blocks, and lambdas.

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Proc objects have lenient arity, so they can be passed fewer or more
# arguments than the Proc is defined to take without throwing an error.
# Procs need to be executed by calling Proc#call

# Group 2
my_lambda = ->(thing) { puts "This is a #{thing}." }
my_second_lambda = ->(thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Lambdas are a subobject of the Proc class. They are defined using a specific
# syntax. In contrast to normal Proc objects, Lambdas have strict arity,
# so they need to be passed the exact number of arguments that they have been
# defined with.

# # Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }
block_method_1('seal')

# Blocks are similar to Proc objects in that they have lenient arity.
# They can be passed fewer or more arguments than the block is defined to take.
# A block is executed using the yield keyword, but if there is a yield
# and a block has not been given, then an error will be thrown.

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

block_method_2('turtle') { puts "This is a #{animal}." }

# Even though blocks have lenient arity, if a variable is referenced
# that has not been defined within the block, the outer scope will be searched
# to resolve the variable reference, throwing an error if no variable or method
# is defined

# Summary

# Procs
# - lenient arity
# - from the Proc class
# - executed with Proc#call
#
# Lambdas
# - strict arity
# - from the Proc class
# - executed with Proc#call
# - defined using a unique syntax
#
# Blocks
# - lenient arity
# - not an object from any class
# - executed using the yield keyword
