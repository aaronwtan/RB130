# Write a method that returns a list of all of the divisors
# of the positive integer passed in as an argument.
# The return value can be in any sequence you wish.

=begin
P
input: positive integer
output: array of all divisors of input
  - divisor of a number divides into the number evenly with no remainder
  - order of output doesn't matter

E
  12
  - 1 <- 12 / 1 = 12
  - 2 <- 12 / 2 = 6
  - 3 <- 12 / 3 = 4
  iteration can stop at sqrt of input

D
- return should be an array
- for each divisor checked, the result of dividing the num by the divisor
  can also be added to the result
- only need to iterate up to sqrt of input

A
1. init result array
2. compute sqrt of input to get iteration stopping point
3. iterate divisors from 1 up to result from step 2
  - for each potential divisor, check if it divides evenly into input
    - if it does, add the divisor and the result of dividing the input by the divisor
      to the result array
    - otherwise continue iteration
4. return result array
C
=end

def divisors(num)
  result = []

  Math.sqrt(num).to_i.downto(1) do |divisor|
    if (num % divisor).zero?
      result << num / divisor
      result.unshift(divisor)
    end
  end

  result.uniq
end

# Examples
p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
