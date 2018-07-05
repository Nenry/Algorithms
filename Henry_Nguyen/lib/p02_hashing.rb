class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
     hash = 0

     self.each_with_index do |el, idx|
      hash = el.hash * idx * 670
     end 
     hash += 1907
  end
end

class String
  def hash
    hash = 0 
    self.chars.each_with_index do |el, idx|
      hash += el.ord % (idx + 1)
    end 
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash = 0 
    self.keys.each_with_index do |key, idx|
      hash += key.to_s.hash + idx
    end 
    hash
    # self.values.each_with_index do |value, idx|
    #   hash += key.to_s.hash + idx
    # end 
  end
end
