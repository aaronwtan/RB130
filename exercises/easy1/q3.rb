# Write a method that takes a sorted array of integers as an argument,
# and returns an array that includes all of the missing integers (in order)
# between the first and last elements of the argument.

def missing(nums)
  result = []

  (nums.first..nums.last).each do |num|
    result << num unless nums.include?(num)
  end

  result
end

# Examples:
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# Further Exploration
# Can you find other ways to solve this problem? What methods might prove useful?
# Can you find a way to solve this without using a method that requires a block?

def missing2(nums)
  result = []
  current_num = nums.first + 1

  while current_num < nums.last
    result << current_num unless nums.include?(current_num)
    current_num += 1
  end

  result
end

p missing2([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing2([1, 2, 3, 4]) == []
p missing2([1, 5]) == [2, 3, 4]
p missing2([6]) == []
