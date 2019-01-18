

def array_to_hash(array)
  # TODO: implement the method :)
  hash={}

  array.each_with_index do |item, index|
      array[item] = yield(index)
    end
  else
    hash[item]
end


# p array_to_hash(["a", "b", "c"])



