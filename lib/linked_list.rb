
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add_first(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
    return new_node.data
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity:
  # Space Complexity
  def search(value)
    raise NotImplementedError
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_max
    return nil if @head.nil?
    current = @head
    max = current.data

    until current.next.nil?
      current = current.next
      if max < current.data
        max = current.data
      end
    end
    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    return nil if @head.nil?

    return nil if @head.nil?
    current = @head
    min = current.data

    until current.next.nil?
      current = current.next
      if min > current.data
        min = current.data
      end
    end
    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    current = @head
    return 0 if @head.nil?
    return 1 if current.next.nil?

    count = 1
    until current.next.nil?
      current = current.next
      count += 1
    end
    return count
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    return nil if index > (self.length - 1)

    current = @head
    until index == 0
      current = current.next
      index -= 1
    end

    return current.data
  end

  # method to print all the values in the linked list
  # Time Complexity:
  # Space Complexity
  def visit
    raise NotImplementedError
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(value)
    return 0 if @head.nil?
    current = @head
    previous = nil

    # if deleting from front
    if current.data == value
      @head = current.next
      return
    else # if deleting from somewhere in middle or end
      until current.data == value
        previous = current
        current = current.next
      end
      previous.next = current.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def reverse
    previous = nil
    current = @head

    while current != nil
      next_node = current.next
      current.next = previous
      previous = current
      current = next_node
    end

    @head = previous
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity:
  # Space Complexity
  def find_middle_value
    raise NotImplementedError
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity:
  # Space Complexity
  def find_nth_from_end(n)
    return nil if n > self.length - 1

    index = self.length - n - 1

    i = 0
    current = @head
    while i < index
      current = current.next
      i += 1
    end

    return current.data
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity:
  # Space Complexity
  def has_cycle
    raise NotImplementedError
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity:
  # Space Complexity
  def get_first
    return @head.nil? ? nil : @head.data
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity:
  # Space Complexity
  def add_last(value)
    new_node = Node.new(value)
    if self.length == 0
      @head = new_node
    else
      last = @head
      until last.next.nil?
        last = last.next
      end
      last.next = new_node
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity:
  # Space Complexity
  def get_last
    return nil if @head.nil?

    current = @head
    until current.next.nil?
      current = current.next
    end

    return current.data
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity:
  # Space Complexity
  def insert_ascending(value)
    raise NotImplementedError
  end

  # Helper method for tests
  # Creates a cycle in the linked list for testing purposes
  # Assumes the linked list has at least one node
  def create_cycle
    return if @head == nil # don't do anything if the linked list is empty

    # navigate to last node
    current = @head
    while current.next != nil
      current = current.next
    end

    current.next = @head # make the last node link to first node
  end
end
