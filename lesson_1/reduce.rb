def reduce(arr, initial = nil)
  counter = initial ? 0 : 1
  acc = initial || arr.first

  while counter < arr.size
    acc = yield(acc, arr[counter])
    counter += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array, 1) { |acc, num| acc + num }
p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(%w{ cat sheep bear }) { |memo, word| memo.length > word.length ? memo : word }
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
