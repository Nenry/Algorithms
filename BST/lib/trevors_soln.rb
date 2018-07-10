# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_into_tree(@root, value)
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if value == tree_node.value

    if value < tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
    @root = remove_from_tree(@root, value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return nil if @root.nil?

    if tree_node.right
      max_node = maximum(tree_node.right)
    else
      max_node = tree_node
    end

    max_node
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?

    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    [left_depth, right_depth].max + 1
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    (left_depth - right_depth).abs < 2 && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    in_order_traversal(tree_node.left, arr) if tree_node.left
    arr.push(tree_node.value)
    in_order_traversal(tree_node.right, arr) if tree_node.right
    arr
  end


  private
  # optional helper methods go here:
  def insert_into_tree(tree_node, value)
    return BSTNode.new(value) if tree_node.nil?

    if value <= tree_node.value
      tree_node.left = insert_into_tree(tree_node.left, value)
    else
      tree_node.right = insert_into_tree(tree_node.right, value)
    end

    tree_node
  end

  def remove_from_tree(tree_node, value)
    if value == tree_node.value
      tree_node = remove(tree_node)
    elsif value <= tree_node.value
      tree_node.left = remove_from_tree(tree_node.left, value)
    else
      tree_node.right = remove_from_tree(tree_node.right, value)
    end

    tree_node
  end

  def remove(node)
    if node.left.nil? && node.right.nil?
      node = nil
    elsif node.left && node.right.nil?
      node = node.left
    elsif node.left.nil? && node.right
      node = node.right
    else
      node = promote_parent(node)
    end
  end

  def promote_parent(node)
    replacement_node = maximum(node.left)

    if replacement_node.left
      direct_child = promote_child(node.left)
    end

    replacement_node.left = direct_child ? direct_child : node.left
    replacement_node.right = node.right
    replacement_node
  end

  def promote_child(node)
    if node.right
      parent = node
      child = node.right

      while child.right
        parent = parent.right
        child = child.right
      end

      parent.right = child.left
      nil
    else
      node.left
    end
  end
end



def kth_largest(tree_node, k)
  kth_node = { count: 0, correct_node: nil }
  reverse_inorder(tree_node, kth_node, k)[:correct_node]
end

def reverse_inorder(tree_node, kth_node, k)
  if tree_node && kth_node[:count] < k
    kth_node = reverse_inorder(tree_node.right, kth_node, k)
    if kth_node[:count] < k
      kth_node[:count] += 1
      kth_node[:correct_node] = tree_node
    end

    if kth_node[:count] < k
      kth_node = reverse_inorder(tree_node.left, kth_node, k)
    end
  end

  kth_node
end

def lca(tree_node, node1, node2)
  smaller = node1.value < node2.value ? node1.value : node2.value
  bigger = node1.value > node2.value ? node1.value : node2.value

  if tree_node.value >= smaller && tree_node.value <= bigger
    lca = tree_node
  elsif tree_node.value > smaller && tree_node.value > bigger
    lca = lca(tree_node.left, node1, node2)
  elsif tree_node.value < smaller && tree_node.value < bigger
    lca = lca(tree_node.right, node1, node2)
  end

  lca
end