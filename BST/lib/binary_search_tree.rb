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
      parent_node = traverse(value)
      if value <= parent_node.value
        parent_node.left = BSTNode.new(value)
      elsif value > parent_node.value 
        parent_node.right = BSTNode.new(value)
      end 
      
    end 
  end

  def find(value, tree_node = @root)
    curr_node = tree_node

    until !curr_node
      if value == curr_node.value 
        return curr_node
      elsif value <= curr_node.value 
        curr_node = curr_node.left
      elsif value > curr_node.value  
        curr_node = curr_node.right 
      end 
    end 
    curr_node

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
    curr_node = @root
    
    until !curr_node.left && value <= curr_node.value ||  !curr_node.right && value > curr_node.value
      
      if value <= curr_node.value
        curr_node = curr_node.left
      elsif value > curr_node.value
        curr_node = curr_node.right
      end 
      # if value <= start.value && !start.left 
      #   start.left = BSTNode.new(value)
      #   found = true
      # elsif value > start.value && !start.right 
      #   start.right = BSTNode.new(value)
      #   found = true
      # elsif value <= start.value && start.left.value 
      #   start = start.left
      #   found = false 
      # elsif value > start.value && start.right.value
      #   start = start.right
      #   found = false 
      # end
    end 
    curr_node
  end 


end
