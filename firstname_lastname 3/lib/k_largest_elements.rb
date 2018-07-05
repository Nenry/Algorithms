require_relative 'heap'
# require_relative 'heap_sort'

def k_largest_elements(array, k)
  heaped = BinaryMinHeap.new

  array.each do |num|
    heaped.push(num)
    heaped.extract if heaped.count == k + 1
  end
  # until results.length == k
  # end 
  return heaped.store
end
