def timer_for
  # TODO: Return time taken to execute the given block
  t1 = Time.now
  # processing...
  yield
  t2 = Time.now
  return t2 - t1 # in seconds
end

def my_map(array)
  # TODO: Re-implement the same behavior as `Enumerable#map` without using it! You can use `#each` though.
  return array.map { |element| yield(element) }
end

def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  return "<#{tag_name}>#{yield}</#{tag_name}>" if attributes.nil?

  attr_name = attributes[0]
  attr_value = attributes[1]
  return "<#{tag_name} #{attr_name}=\"#{attr_value}\">#{yield}</#{tag_name}>"
end


