class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot = array[0]
    left = []
    right = []
    array[1..-1].each do |num|
      if num <= pivot 
        left << num 
      else 
        right << num
      end 

    end 

    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)


  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new{|x, y| x <=> y}

    return array if length < 2
    
    # It will move/mutate the pivot to the correct location in the array, left + pivot + right and return the correct pivot idx
    pivot = self.partition(array, start, length, &prc)
    
    # Left length side of the pivot, [left]
    left = pivot - start

    #right length side is left + pivot + right = length, right = length - left - pivot(space), use 1 since pivot is idx
    right  = length - (left + 1) 

    # Sort left side and starting idx will be 0 since that's the first number
    # sort right side, starting idx will be pivot + 1 
      self.sort2!(array, 0, left, &prc)
      self.sort2!(array, pivot + 1, right, &prc)

    array


  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|x, y| x <=> y}


    pivot_idx = start
  
    #Moving idx when iteration finds a value smaller than pivot 
    barrier_idx = start

    #iterator
    (start + 1...start + length).each do |idx|
  
          
      #move the barrier when the iteration's element is smaller than the pivot 
      #swap the iteration and barrier spot 
      #[0, 1, 2, 3, 4] => [4, 3, 2, 1, 0]

      if prc.call(array[pivot_idx], array[idx]) == 1
        barrier_idx += 1
        
        array[idx], array[barrier_idx ] = array[barrier_idx], array[idx]
      end 

    end 

  array[barrier_idx], array[pivot_idx] = array[pivot_idx], array[barrier_idx]

  barrier_idx
  end
end
