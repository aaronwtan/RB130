# In this exercise, your task is to create a new Enumerator object.
# When creating a new Enumerator, you may define what values are iterated upon.
# We'll want to create an Enumerator that can iterate over
# an infinite list of factorials. Once you make this new Enumerator,
# test it out by printing out the first 7 factorial values,
# starting with zero factorial.

# More specifically, print the first 7 factorials
# by using an "External Iterator". Once you have done so,
# see what happens if you print 3 more factorials. Now, reset your Enumerator
# (use the rewind method). Finally, print 7 more factorials.

# n0    n1    n
# 1     1
# 1     2     2
# 2     6     3
# 6     24    4
# 24    120   5
# 120   720   6

fact = Enumerator.new do |yielder|
  n = 2
  current_factorial = next_factorial = 1
  loop do
    yielder << current_factorial
    current_factorial = next_factorial
    next_factorial *= n
    n += 1
  end
end

puts "External iteration:"
7.times { |num| puts "#{num}! == #{fact.next}" }
puts
3.times { |num| puts "#{num}! == #{fact.next}" }
puts

fact.rewind

7.times { |num| puts "#{num}! == #{fact.next}" }
puts
puts

puts "Internal iteration:"
fact.each_with_index do |factorial, num|
  puts "#{num}! == #{factorial}"
  break if num >= 6
end
