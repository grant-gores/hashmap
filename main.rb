require_relative './lib/hashmap.rb'

test = HashMap.new
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

p test.size

test.remove('dog')

p test.size

test.set('pumpkin', 'orange')

p test.get('pumpkin')

p test.keys

p test.values

p test.entries

test.clear

p test.size