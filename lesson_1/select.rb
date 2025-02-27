# array = [1, 2, 3, 4, 5]

# array.select { |num| num.odd? }       # => [1, 3, 5]
# array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

def select(arr)
  counter = 0
  selected_elements = []

  while counter < arr.size
    current_element = arr[counter]
    selected_elements << current_element if yield(current_element)
    counter += 1
  end

  selected_elements
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }       # => [1, 3, 5]
p select(array) { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
