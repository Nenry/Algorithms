# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil 
  end

  def insert(value)
    if !root
      @root = BSTNode.new(value)
    else 
      traverse(value)
    end 
  end

  def find(value, tree_node = @root)
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def traverse(value)
    start = @root
    found = false
    until found
      if value <= start.value && !start.left 
        start.left = BSTNode.new(value)
        found = true
      elsif value > start.value && !start.right 
        start.right = BSTNode.new(value)
        found = true
      elsif value <= start.value && start.left.value 
        start = start.left
        found = false 
      elsif value > start.value && start.right.value
        start = start.right
        found = false 
      end
    end 
  end 


end
