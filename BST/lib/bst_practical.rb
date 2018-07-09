require_relative 'binary_search_tree'
def kth_largest(tree_node, k)
sorted = sort_order_traversal(tree_node)
value = sorted[sorted.length - k]
# p value
find_node(value, tree_node)

end


def sort_order_traversal(tree_node = @root, arr = [])
  return [tree_node.value] if !tree_node.left && !tree_node.right

  if tree_node.left
    arr += sort_order_traversal(tree_node.left)
  end

  arr.push(tree_node.value)


  if tree_node.right
    arr += sort_order_traversal(tree_node.right)
  end
  arr

end


def find_node(value, tree_node = @root)
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