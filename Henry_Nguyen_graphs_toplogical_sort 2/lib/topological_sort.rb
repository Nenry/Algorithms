require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []

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

#Tarjan
#loops through each node of the graph/vertices
#DFS that terminates when it hits any node that has already been visited or
#no outgoing edges
#a vertice only gets placed in the results after considering 
#all other vertices which depend on that original vertice
#when this vertice is added, it is guaranteed that nodes depend on it are already in the output
#recursive call to visit()

#visit() loops through each node of the graph/vertices 

def topological_sort(vertices)
  sorted = []
  visited = []

  vertices.each do |vertex|
    visit(vertex, visited, sorted)
  end 

  sorted 
end

def visit(vertex, visited, sorted)
  return if visited.include?(vertex)
  
  



end 




