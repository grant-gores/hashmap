class HashMap
  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @buckets = Array.new(capacity)
  end
  
  def hash(key)
      hash_code = 0
      prime_number = 31
      key.each_char{ |char| hash_code = prime_number * hash_code + char.ord }
      hash_code
  end
  
def set(key, value)
  index = hash(key) % @capacity

  # Check if index is out of bounds
  raise IndexError if index.negative? || index >= @buckets.length

  if @buckets[index].nil?
    @buckets[index] = [[key, value]]
  else
    # Update or add the key-value pair in the bucket
    existing_entry = @buckets[index].find { |pair| pair[0] == key }
    if existing_entry
      existing_entry[1] = value
    else
      @buckets[index] << [key, value]
    end
  end

  # Check if we need to resize the bucket array
  if load_factor_exceeded?
    resize
  end
end

def load_factor_exceeded?
  total_entries = @buckets.flatten(1).size
  total_entries > (@capacity * @load_factor)
end

def resize
  new_capacity = @capacity * 2
  new_buckets = Array.new(new_capacity)

  @buckets.flatten(1).each do |key, value|
    index = hash(key) % new_capacity
    if new_buckets[index].nil?
      new_buckets[index] = [[key, value]]
    else
      new_buckets[index] << [key, value]
    end
  end

  @capacity = new_capacity
  @buckets = new_buckets
end


# other methods
def get(key)
  index = hash(key) % @capacity
  raise IndexError if index.negative? || index >= @buckets.length

  bucket = @buckets[index]
  return nil unless bucket

  pair = bucket.find { |k, _v| k == key }
  pair.nil? ? nil : pair[1]
end

def has?(key)
  index = hash(key) % @capacity
  raise IndexError if index.negative? || index >= @buckets.length

  bucket = @buckets[index]
  return false unless bucket

  bucket.any? { |k, _v| k == key }
end

def remove(key)
  index = hash(key) % @capacity
  raise IndexError if index.negative? || index >= @buckets.length

  bucket = @buckets[index]
  return nil unless bucket

  pair = bucket.find { |k, _v| k == key }
  return nil unless pair

  bucket.delete(pair)
  pair[1]
end

def length
  @buckets.flatten(1).size
end

def clear
  @buckets = Array.new(@capacity)
end

def keys
  @buckets.flatten(1).map { |k, _v| k }
end

def values
  @buckets.flatten(1).map { |_k, v| v }
end

def entries
  @buckets.flatten(1)
end
end
 
