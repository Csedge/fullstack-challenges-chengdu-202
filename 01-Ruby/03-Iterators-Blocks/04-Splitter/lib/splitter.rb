def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  new_array = array.select { | element | element.size == size }
  new_array_ext = array.reject { | element| element.size == size }
  return [new_array.sort, new_array_ext.sort]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.

  array_1 = array.select{|element|yield(element)}
  array_2 = array.reject{|element|yield(element)}
  return [array_1,array_2]
end



