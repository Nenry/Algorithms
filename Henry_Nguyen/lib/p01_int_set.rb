class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @length = max

  end

  def insert(num)
    raise "Out of bounds" if num > @length || num < 0
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num > @length || num < 0
    @store[num] = false 
  end

  def include?(num)
        @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    resize! if @num_buckets <= @count
    self[num] << num
    @count += 1
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
        @store[num % @num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    @count = 0
    @num_buckets *= 2
    old_store = @store.flatten.dup
    @store = new_store
    old_store.each do |num|
      self.insert(num)
    end 
      
    
  end
end
