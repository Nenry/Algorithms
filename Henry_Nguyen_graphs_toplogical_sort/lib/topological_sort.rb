require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  all_vertices = []
  top = []
    vertices.each do |vertex|
      if vertex.in_edges.empty?
        top << vertex
      end 
    end 

    until top.empty?
      
      current = top.pop 
      sorted << current 

      current.out_edges.each do |edge|
        all_vertices << edge.to_vertex
        edge.to_vertex.in_edges.delete(edge)
  
        if edge.to_vertex.in_edges.empty?
          top << edge.to_vertex
        end 
      end 
        

    end 
    if sorted.length == vertices.length 
      sorted 
    else 
      []
    end 
  end 
  # p vertices.length
  # result = []
  # return vertices if vertices.empty?
  
  # to_be_placed = []
  # vertices.each_with_index do |vert, idx|
  #   # p "#{idx}:#{vert.in_edges.length}"
  #   if vert.in_edges.empty?
  #     to_be_placed << idx
  #   end
  # end 

  # to_be_placed.each do |idx|
  #   result << vertices[idx].value
    
  # end
  
  # to_be_placed.each do |idx|
  #   vertices[idx].out_edges.each do |edge|
  #     edge.destroy!
  #   end 
  #   vertices.delete_at(idx)
  # end 

  
  # vertices.each_with_index do |vert, idx|
  #   p "#{idx}:#{vert.in_edges.length}"
  # end 
  # p vertices.length
  # topological_sort(vertices)
  # debugger
  # topological_sort(vertices)

  # result.concat(topological_sort(vertices))




# end

#iterate through vertices, 
# if vertices has no in_edges 
#then take it out and shovel in that vertice
# delete the out_edges
#next iteration





