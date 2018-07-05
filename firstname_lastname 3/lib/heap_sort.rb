require_relative "heap"

class Array
  def heap_sort!
    # p self
    self.each_index do |i|
      BinaryMinHeap.heapify_up(self, i) {|el1, el2| el2 <=> el1}
    end
    # p self

    (self.length - 1).downto(1) do |i|
      self[0], self[i] = self[i], self[0]
      BinaryMinHeap.heapify_down(self, 0, i) {|el1, el2| el2 <=> el1}
    end 
  #  self
  end
end
