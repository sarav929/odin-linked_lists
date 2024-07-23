class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end
  # append(value) adds a new node containing value to the end of the list

  def append(value)
    new_node = Node.new(value)
    if @tail
      @tail.next_node = new_node
    else
      @head = new_node
    end
    @tail = new_node
  end

  # prepend(value) adds a new node containing value to the start of the list

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
    return unless @tail.nil?

    @tail = new_node
  end

  # size returns the total number of nodes in the list

  def size
    count = 0
    current = @head
    until current.nil?
      count += 1
      current = current.next
    end
    count
  end

  # head returns the first node in the list
  attr_reader :head

  # tail returns the last node in the list

  attr_reader :tail

  # at(index) returns the node at the given index
  def at(index)
    return nil if @head.nil?
    return @head if index == 0

    current = @head
    count = 0
    while current && count != index
      current = current.next_node
      count += 1
    end
    current
  end

  # pop removes the last element from the list
  def pop
    return if @head.nil?

    if @head == @tail
      @head = @tail = nil
      return
    end
    current = @head
    current = current.next_node until current.next_node == @tail
    current.next_node = nil
    @tail = current
  end

  # contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current = @head
    while current
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  # find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    current = @head
    count = 0
    while current
      return count if current.value == value

      count += 1
      current = current.next_node

    end
    nil
  end

  # to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    string = ''
    current = @head
    while current
      string += "( #{current.value} )"
      string += ' -> ' unless current.next_node.nil?
      current = current.next_node
    end
    string += ' -> nil'
    string
  end

  # insert_at(value, index) that inserts a new node with the provided value at the given index.
  def insert_at(value, index)
    new_node = Node.new(value)
    if index == 0
      new_node.next_node = @head
      @head = new_node
      @tail = new_node if @tail.nil?
      return
    end
    current = @head
    count = 0
    while current && count < index - 1
      current = current.next_node
      count += 1
    end
    if current.nil?
      puts 'Index out of bounds'
      return
    end
    new_node.next_node = current.next_node
    current.next_node = new_node
    @tail = new_node if new_node.next_node.nil?
  end

  # remove_at(index) that removes the node at the given index.

  def remove_at(index)
    return if @head.nil?

    if index == 0
      @head = @head.next_node
      @tail = nil if @head.nil?
      return
    end
    current = @head
    count = 0
    while current && count < index - 1
      current = current.next_node
      count += 1
    end
    if current.nil? || current.next_node.nil?
      puts 'Index out of bounds'
      return
    end
    current.next_node = current.next_node.next_node
    @tail = current if current.next_node.nil?
  end
end