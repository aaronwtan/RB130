[1, 2, 3].each { |num| "do nothing" }                           # still returns [1, 2, 3]

def each(arr)
  counter = 0

  while counter < arr.size
    yield(arr[counter])
    counter += 1
  end

  arr
end

each([1, 2, 3]) { |num| puts "do nothing" }
each([1, 2, 3]) { |num| puts num }
