class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2

    pivot_idx = rand(array.length)
    pivot_val = array[pivot_idx]

    left = [] 
    right = []

    array.each_with_index do |el, curr_idx|
      next if pivot_idx == curr_idx
      if el < pivot_val
        left << el 
      else
        right << el 
      end 
    end 

    sort1(left) + [pivot] + sort1(right)

  end

  def self.swap (array, a, b)
    array[a], array[b] = array[b], array[a]
  end 
  
  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)

    return array if length < 2

    # prc = Proc.new {|x, y| x <=> y}

    piv_idx = partition(array, start, length, &prc)

    left_length = piv_idx - start
    right_length = length - (left_length + 1)

    sort2!(array, start, left_length, &prc)
    sort2!(array, piv_idx + 1, right_length, &prc)
  end

  def self.partition(array, start, length, &prc)
    # part_idx = rand(length) + start #ideal but does not work in specs 
    # prc = Proc.new {|x, y| x <=> y}
    piv_idx = start
    piv_val = array[piv_idx]

    ((start + 1)...(start + length)).each do |curr_idx|
      curr_val = array[curr_idx]
      
      if prc.call(curr_val, piv_val) < 0 
        piv_idx += 1
        swap(array, piv_idx, curr_idx)
      end 
    end 

    swap(array, start, piv_idx)

    piv_idx
  end
end
