require 'byebug'

class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
            
    n_one_less_odd = (n - 1) * 2 - 1
    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2)  + n_one_less_odd

  end

  def frog_cache_builder(n)
    possible_hops = [1, 2, 3]
    cache = {0 => [], 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]]}
    # return nil if n < 0
    return cache if n < 4
    (4..n).each do |n|
      # debugger  
      cache[n] = cache[n - 1].map {|el| el + [1]} + cache[n - 2].map{|el| el + [2]} + cache[n - 3].map {|el| el + [3]}
    end 

    cache
    

  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)

    cache[n]
    
  end



#   def fib_cache_builder(n)
#   # Builds the cache, starting at 1 and ending at n
#   cache = { 1 => 1, 2 => 1 }
#   return cache if n < 3
#   (3..n).each do |i|
#     cache[i] = cache[i - 1] + cache[i - 2]
#   end

#   cache
# end

# def fibonacci(n)
#   # Calls the helper function
#   cache = fib_cache_builder(n)
#   # Returns the nth entry
#   cache[n]
# end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
