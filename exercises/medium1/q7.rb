# In an earlier exercise, you were asked to construct a #bubble_sort! method
# that used the bubble sort algorithm to sort Arrays in place.
# Our solution was this:
# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end

# The problem with this solution is that it doesn't give you any freedom
# in terms of the criteria used for the sort. For example, perhaps you want
# to sort the Array in reverse order from usual, or perhaps you want to sort a
# list of names in a case-insensitive manner.

# Your task in this assignment is to modify #bubble_sort! so it takes
# an optional block that determines which of two consecutive elements
# will appear first in the results.

# If you still have a copy of your #bubble_sort! method, you may use
# that method as the basis for this exercise. Otherwise, you can use
# the above solution.

def bubble_sort!(arr, &comparator)
  nth = arr.length
  loop do
    new_nth = 0
    1.upto(nth - 1) do |i|
      first = arr[i - 1]
      second = arr[i]

      if comparator.nil?
        next if first < second
      elsif comparator.parameters.size == 1
        next if comparator.call(first) <= comparator.call(second)
      elsif comparator.parameters.size == 2
        next if comparator.call(first, second)
      end

      arr[i - 1], arr[i] = arr[i], arr[i - 1]
      new_nth = i
    end
    nth = new_nth

    break if nth <= 1
  end
end

# Examples:
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# Further Exploration
array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
