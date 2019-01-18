def anagrams?(a_string, another_string)
  normalized_string(a_string).chars.sort == normalized_string(another_string).chars.sort
end

def anagrams_on_steroids?(a_string, another_string)
  # Two anagrams have the same letter repartition
  char_frequencies(a_string) == char_frequencies(another_string)
end

# Method to normalize a string from special chars and uppercases
def normalized_string(string)
  string.gsub(/\W/, "").downcase # \W => standing for any non-word character
end

# Compute number of occurrences of each letter in a string
def char_frequencies(a_string)
  normalized_string(a_string).chars.reduce(Hash.new(0)) do |hash, char|
    hash[char] += 1
    hash
  end
end
