class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @prc = prc
  end
  
  def count
    @store.length 
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    popped = @store.pop
    self.class.heapify_down(store, 0)
    return popped
  end

  def peek
  end

  def push(val)
    @store.push(val)
    self.class.heapify_up(store, count - 1)

  end

  public
  def self.child_indices(len, parent_index)
    child_idxes = []
    idx = parent_index * 2
    child_idxes << idx + 1 if idx + 1 < len 
    child_idxes << idx + 2 if idx + 2 < len
    child_idxes
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2} 
    child1_idx = self.child_indices(len, parent_idx)[0]
    child2_idx = self.child_indices(len, parent_idx)[1]
    # keep heapifying down until it reaches bottom, which is when there are no children
    # or if only the left child exists and parent is still smaller
    #  or if insert a compliant element at the end then no function is over
    until (child1_idx == nil && child2_idx == nil) ||
      (child1_idx && !child2_idx && prc.call(array[parent_idx], array[child1_idx]) == -1) ||
      (prc.call(array[parent_idx], array[child1_idx]) == -1 && prc.call(array[parent_idx], array[child2_idx]) == -1)
      if child2_idx #if child2 exists then we need to decided the smallest between the two
        new_idx = prc.call(array[child1_idx], array[child2_idx]) == -1 ? child1_idx : child2_idx
      else 
        new_idx = child1_idx #else just swap with the left child
      end 
      
      # swap child and parent 
      array[parent_idx], array[new_idx] = array[new_idx], array[parent_idx]
      parent_idx = new_idx
      # the new argument is the new_idx
      # 
      child1_idx = self.child_indices(len, parent_idx)[0]
      child2_idx = self.child_indices(len, parent_idx)[1]

    end 
    array
  end


  # use parent index method is find via child_idx
  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2}

    parent_idx = self.parent_index(child_idx) unless child_idx == 0

    # stop when child_idx == 0 because that is the root, if you're are the root then its already been sorted up to there
    until child_idx == 0 || prc.call(array[parent_idx], array[child_idx]) == -1
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      child_idx = parent_idx
      parent_idx = self.parent_index(child_idx) unless child_idx == 0
    end 
    array
  end
end
