require_relative 'p05_hash_map'

def can_string_be_palindrome?(string) 
  count_hash = HashMap.new
  chars = string.chars
  chars.each do |char|
    new_val = count_hash.get(char) 
    if new_val
      count_hash.set(char, new_val + 1)
    else 
      count_hash.set(char, 1)
    end 

  end 

  odds = 0
  chars.each do |char|
    odds += 1 if count_hash.get(char).odd?
  end 

  if odds > 1
    return false 
  else
    return true
  end 

  

  
end
