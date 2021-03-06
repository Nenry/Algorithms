class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new 
    @tail = Node.new 
    @head.next = @tail
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.val if node.key == key}
  end

  def include?(key)
    each do |node|
      return true if node.key == key 
    end 
    return false 
  end

  def append(key, val)
    # p self.first
    if !include?(key)
      new_node = Node.new(key, val)
      @tail.prev.next = new_node
      new_node.prev = @tail.prev
      new_node.next = @tail
      @tail.prev = new_node
      new_node
    else 
      update(key,val)
    end 
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
        return node
      end

    end 
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.prev.next = node.next
        node.next.prev = node.prev
        return node
      end 
    end 

  end

  def each
    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end 
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
