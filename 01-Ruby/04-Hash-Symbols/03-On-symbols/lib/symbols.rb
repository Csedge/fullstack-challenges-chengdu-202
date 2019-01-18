# NOTE: Read about BasicObject#object_id
# http://www.ruby-doc.org/core-2.4.0/BasicObject.html#method-i-__id__

# You can try launching `irb` to test some values
# irb> :foo.object_id
# irb> :foo.object_id
# irb> "foo".object_id
# irb> "foo".object_id

def are_identical_symbols_same_objects?
  # TODO: Answer the question by making this method to return true or false
  true
end

def are_identical_strings_same_objects?
  # TODO: Answer the question by making this method to return true or false
  false
end


# Remember, RTFM! Your doc is your friend
# - http://www.ruby-doc.org/core-2.4.0/String.html
# - http://www.ruby-doc.org/core-2.4.0/Symbol.html

def convert_string_to_symbol(a_string)
  # TODO: return the symbol version of the parameter `a_string` passed to this method
  a_string.intern
end

def convert_symbol_to_string(a_symbol)
  # TODO: return the string version of the parameter `a_symbol` passed to this method
  a_symbol.to_s
end

def me
  # TODO: return a Hash representing yourself, with keys such as age and name
  {
    name: "Ellery",
    age: 14
  }
end

def fruits
  # TODO: return an array of fruits
  array = ['apple', 'pen', 'applepen', 'pinapple', 'pinapplepen']
  return array
end
