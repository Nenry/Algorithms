def topological_sort(vertices)
  queue = []
  order = []
  in_edge_count = {}

  veritces.each do |vertex|
    in_edge_count[vertex] = vertex.in_edges.count
    queue << vertex if vertex.in_edges.empty?
  end 

  until queue.empty?
    current = queue.shift 
    order << current 

    current.out_edges.each do |edge|
      to_vet = edge.to_vertex 
      in_edge_count[to_vert] -= 1 
      queue << to_vert if in_edge_count[to_vert] == 0
    end 
  end 

  order.length == vertices.length ? order : []
end

#using destroy
def topological_sort(vertices)
  queue = []
  order = []

  veritces.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
  end 

  until queue.empty?
    current = queue.shift 
    order << current 

    current.out_edges.dup.each do |edge|
      to_vet = edge.to_vertex 

      queue << to_vert if to_vert.in_edges.count <= 1
      edge.destroy!
    end 
  end 

  order.length == vertices.length ? order : []
end




# Tarjan's algorithm without cycle catching
def topological_sort(vertices)
  order = []
  explored = Set.new 

  vertices.each do |vertex|
    dfs!(order, explored, vertex) unless explored.include?(vertex)
  end 

  order 

end 

def dfs!(order, explored, vertex)
  explored.add(vertex)

  vertex.out_edges.each do |edge|
    to_vertex = edge.to_vertex
    dfs!(order, explored, to_vertex) unless explored.include?(vertex)
  end 

  order.unshift(vertex)
end 


#with cyclic catching
def topological_sort(vertices)
  order = []
  explored = Set.new 
  temp = Set.new
  cycle = false 

  vertices.each do |vertex|
    cycle = dfs!(order, explored, vertex) unless explored.include?(vertex)
    return [] if cycle 
  end 

  order 

end 

def dfs!(order, explored, vertex, temp, cycle)
  return true if temp.include?(vertex)
  temp.add(vertex)

  vertex.out_edges.each do |edge|
    to_vertex = edge.to_vertex
    cycle = dfs!(order, explored, to_vertex, temp, cycle) unless explored.include?(vertex)
    return true if cycle
  end 
  
  explored.add(vertex)
  temp.delete(vertex)
  order.unshift(vertex)
  false
end 



def install_order(arr)
  max = 0
  independent = []
  vertices = {}

  arr.each do |tuple|
    vertices[tuple[0]] = Vertex.new(vertices[tuple[0]]) unless vertices[tuple[0]]
    vertices[tuple[1]] = Vertex.new(vertices[tuple[1]]) unless vertices[tuple[1]]
    Edge.new(vertices[tuple[1]], vertices[tuple[0]])
    max = tuple.max if tuple.max > max

  end 

  (1..max).each do |i|
    independent << i unless vertices[i]
  end 

  independent + topological_sort(vertices.values).map {|v| v.value}
end 