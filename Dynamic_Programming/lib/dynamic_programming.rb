require 'byebug'

class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_cache = {0 => [], 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]]}
    @super_frog_cache = { 0 => [], 1 => [[1]], 2 => [[1, 1], [2]]}
    @maze_cache = []
    @knapsack_cache = {}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
            
    n_one_less_odd = (n - 1) * 2 - 1
    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2)  + n_one_less_odd

  end

  def frog_cache_builder(n)
    
    cache = {0 => [[]], 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]]}
    # return nil if n < 0
    return cache if n < 4
    (4..n).each do |n|
      # debugger  
      cache[n] = cache[n - 1].map {|el| el + [1]} + cache[n - 2].map{|el| el + [2]} + cache[n - 3].map {|el| el + [3]}
    end 

    cache
    

  end


  # instead of mapping everything with hardcoding with [1], [2], [3]
  # make cache builder have a k = 3 second argument
  # base  0 => [[]] 1 => [[1]]
  # n and k iterative, push cache after k finishes 

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)

    cache[n]
    
  end

  def frog_hops_top_down(n)
    return @frog_cache[n] if @frog_cache[n]

    frog_hops_top_down_helper(n) 
   
    
    
  end
  
  def frog_hops_top_down_helper(n)

    return @frog_cache[n] if @frog_cache[n]

    @frog_cache[n] = frog_hops_top_down_helper(n - 1).map{|el| el + [1]} + frog_hops_top_down_helper(n - 2).map {|el| el + [2]} + frog_hops_top_down_helper(n - 3).map {|el| el + [3]}


    

  end

  def super_frog_hops(num_stairs, max_stairs)
    cache = super_frogs_hops_cache(num_stairs, max_stairs)
    cache[num_stairs]

    
  end

  def super_frogs_hops_cache(n, k)
    cache = {0 => [[]], 1 => [[1]]}

    return cache if n < 2

    (2..n).each do |steps|
      result = []
      (1..k).each do |max_steps|
        break if max_steps > steps
        cache[steps - max_steps].each do |combo|

          result << combo + [max_steps]
        end 
      end 
      cache[steps] = result
    end 

    return cache

  end 

  def knapsack(weights, values, capacity)
    
    weights.each_with_index do |weight, idx |
      
    end 

    #iterate through each weight 
    #weight > capacity, next 
    #if capacity == 0, return 0 
    # total capacity == any of the current items
    # && the value is greater 

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
    populate_maze_cache(maze)
    solve_maze(maze, start_pos, end_pos)
  end

  private 
  def populate_maze_cache(maze)

  end 

  def solve_maze(maze, start, finish_pos)
    #left, right, up, down 


  end 

end
