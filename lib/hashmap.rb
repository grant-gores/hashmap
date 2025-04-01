require_relative 'linked_lists.rb'

class HashMap
    attr_reader :load_factor, :size

    def initialize
        @load_factor = 0.75
        @capacity = 16
        @buckets = Array.new(@capacity) { LinkedList.new }
        @size = 0
    end

    def hash(key)
        hash_code = 0
        prime_number = 31
           
        key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
           
        hash_code
    end

    def set(key, value)
        index= hash(key) % @capacity
        bucket = @buckets[index] 

        node = bucket.find(key)
        if node
            node.value=value
        else 
            bucket.append(key, value)
            @size += 1
        end
        resize if @size.to_f / @capacity > @load_factor
    end

    def get(key)
        index = hash(key) % @capacity
        node = @buckets[index].find(key)
        node.nil? ? nil : node.value
    end

    def has?(key)
        !get(key).nil?
    end

    def remove(key)
        index = hash(key) % @capacity
        removed_value = @buckets[index].remove(key)
        @size -=1 if removed_value
        removed_value
    end

    def resize
        old_buckets = @buckets
        @capacity *= 2
        @buckets = Array.new(@capacity) { LinkedList.new }
        @size = 0
      
        old_buckets.each do |bucket|
          bucket.to_a.each { |key, value| set(key, value) }
        end
    end
      

    def length
        @size
    end

    def clear
        @buckets = Array.new(@capacity) { LinkedList.new }
        @size = 0
    end

    def keys
        key_array = []
        @buckets.each do |bucket|
          current = bucket.head  
          while current
            key_array << current.key  
            current = current.next_node  
          end
        end
        key_array
    end

    def values
        value_array = []
        @buckets.each do |bucket|
          current = bucket.head 
          while current
            value_array << current.value  
            current = current.next_node
          end
        end
        value_array
    end
        
    def entries
        entries_array = []  
        @buckets.each do |bucket|
          current = bucket.head
          while current
            entries_array << [current.key, current.value]
            current = current.next_node
          end
        end
        entries_array
    end
        
end