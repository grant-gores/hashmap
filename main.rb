require_relative './lib/hashmap.rb'

# Create an instance of the HashMap with load factor 0.75
test = HashMap.new(16, 0.75)

# Populate the hash map
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# Check length and load factor (should be close to 0.75)
puts "Length before expanding: #{test.length}"
puts "Capacity before expanding: #{test.instance_variable_get(:@capacity)}"

# Overwrite some existing nodes
test.set('apple', 'green')
test.set('banana', 'brown')

# Check length again (should be same as before)
puts "Length after overwriting: #{test.length}"

# Add a new item to trigger a resize
test.set('moon', 'silver')

# Check if the load factor is below 0.75 after resize
puts "Length after resizing: #{test.length}"
puts "Capacity after resizing: #{test.instance_variable_get(:@capacity)}"

# Test other methods
puts "Get 'apple': #{test.get('apple')}"
puts "Has 'banana': #{test.has?('banana')}"
puts "Remove 'carrot': #{test.remove('carrot')}"
puts "All keys: #{test.keys}"
puts "All values: #{test.values}"
puts "All entries: #{test.entries}"

# Clear the hash map and check if it's empty
test.clear
puts "Length after clear: #{test.length}"