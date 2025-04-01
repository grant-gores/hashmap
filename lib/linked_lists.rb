require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end 

  def append(key, value)
    new_node = Node.new(key, value)

    if @head.nil?
      @head = new_node
    else
      current = @head
      while current.next_node
        current = current.next_node
      end
      current.next_node = new_node
    end
  end

  def find(key)
    current = @head
    while current
      return current if current.key == key
      current = current.next_node
    end
    nil
  end

  def remove(key)
    return nil if @head.nil?

    # Handle case where the head node contains the key
    if @head.key == key
      removed_node = @head
      @head = @head.next_node
      return removed_node.value
    end

    # Traverse the list to find and remove the node
    current = @head
    while current.next_node
      if current.next_node.key == key
        removed_node = current.next_node
        current.next_node = current.next_node.next_node
        return removed_node.value
      end
      current = current.next_node
    end
    nil
  end

  def head
    @head
  end

  def to_s
    current = @head
    result = ""
    
    while current
      result << "( #{current.key}: #{current.value} ) -> "
      current = current.next_node
    end
    
    result << "nil"
    result
  end
end