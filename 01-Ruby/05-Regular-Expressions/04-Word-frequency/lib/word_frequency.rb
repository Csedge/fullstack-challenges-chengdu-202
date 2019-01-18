def most_common_words(file_name, stop_words_file_name, number_of_word)
  stop_array = []
  common_words = {}

  File.open(stop_words_file_name, "r").each_line { |line| stop_array << line.split }

  stop_array = stop_array.flatten

  File.open(file_name, "r").each_line do |line|
    words = line.split
    words.each do |word|
      word = word.downcase.gsub(/\W\w*/i, '')
      common_words.key?(word) ? common_words[word] += 1 : common_words[word] = 1 unless stop_array.include? word
    end
  end
  Hash[common_words.sort_by { |_word, frequency| -frequency }[0...number_of_word]]
end

# puts most_common_words("../spec/obama.txt", "./stop_words.txt", 40)
