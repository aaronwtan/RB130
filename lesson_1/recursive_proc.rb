def greet(&block)
  puts "Hello!"
  yield(block, 1) if block
  puts "Goodbye!"
end

greet do |proc, count|
  puts "Inside block, count: #{count}"
  proc.call(proc, count + 1) if count < 2
end
