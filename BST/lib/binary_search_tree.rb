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
        parent_node.left.parent = parent_node
      elsif value > parent_node.value 
        parent_node.right = BSTNode.new(value)
        parent_node.right.parent = parent_node
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
    delete_node = find(value)
    # p delete_node.value
    replacement_node = children?(delete_node) > 0 ? replace_node(delete_node) : nil
      # p replacement_node.value
      # p replacement_node.value
    if @root.value == value
      @root = nil
      return  
    end 

    if delete_node.parent.left == delete_node  
      # p delete_node.parent.left
      delete_node.parent.left = replacement_node  
    elsif delete_node.parent.right == delete_node
      delete_node.parent.right = replacement_node
    end

    if replacement_node
     if replacement_node.parent.left == replacement_node
        replacement_node.parent.left = replacement_node.left
     end 
     if replacement_node.parent.right == replacement_node
        replacement_node.parent.right = replacement_node.left
     end 
    end


    # if !replacement_node.nil?
    #   replacement_node.parent.left = replacement_node.left
    #   replacement_node.parent.right = replacement_node.right
    # end 
      



  end

  # helper method for #delete:
  def replace_node(tree_node = @root)
    maximum_node = tree_node
    left = tree_node.left 
    right = tree_node.right 
    if left && right
      maximum_node = maximum_node.left.right
      until !maximum_node.right
        maximum_node = maximum_node.right
      end 
      return maximum_node
    elsif left && !right
      maximum_node = left
      return maximum_node
    elsif !left && right
      maximum_node = maximum_node.right  
      return maximum_node
    elsif children?(tree_node)
      return nil 
    end 
  end

  def maximum(tree_node = @root)
    maximum_node = tree_node
   
      until !maximum_node.right
        maximum_node = maximum_node.right
      end 
      return maximum_node

  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || !tree_node.left && !tree_node.right

    left = depth(tree_node.left)
    right = depth(tree_node.right)

    left > right ? left + 1 : right + 1
  
  end 

  def is_balanced?(tree_node = @root)
    left = depth(tree_node.left)
    right = depth(tree_node.right)
    (left - right).abs < 1
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [tree_node.value] if !tree_node.left && !tree_node.right

    if tree_node.left
      arr += in_order_traversal(tree_node.left)
    end

    arr.push(tree_node.value)


    if tree_node.right
      arr += in_order_traversal(tree_node.right)
    end
    arr

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
  
  def children?(node)
    child_count = 0 

    if node.left 
      child_count += 1
    end 

    if node.right 
      child_count += 1
    end 

    return child_count
    
  end 


end
