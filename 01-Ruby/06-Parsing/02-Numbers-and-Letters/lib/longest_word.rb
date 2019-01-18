require 'open-uri'
require 'json'
require 'set'


VOWEL = ['a', 'e', 'i', 'o', 'u']
CONSONANT = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  #random number generator : 0, 1
  grid_array = []

  for i in 0..grid_size - 1
    consonant_or_vowel = rand(2)
    # if 0 -> pick up a words in VOWEL
    grid_array << VOWEL[rand(5)] if consonant_or_vowel == 0
    # if 1 -> pick up a words in CONSONANT
    grid_array << CONSONANT[rand(21)] if consonant_or_vowel == 1
  end
  grid_array.map!(&:upcase)
end



def is_in_dictionary(attempt)
  attempt = attempt.join("")
  attempt_return = open("https://wagon-dictionary.herokuapp.com/#{attempt}").read
  attempt_return = JSON.parse(attempt_return)
  return attempt_return["found"]
end

def is_subset(attempt, grid)
  attempt = attempt.to_set
  grid = grid.to_set
  return attempt.subset?(grid)
end


def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result
  result = {}
  time = end_time - start_time
  num_words = attempt.size

  #get BOOLEAN operators
  is_subset = is_subset(attempt, grid)
  is_in_dictionary = is_in_dictionary(attempt)


  # check if the attempt is in the grid_?
  if is_subset == true   #If YES,
      # check if the attempt is in the dictionary_?
      if is_in_dictionary == true
      # if both are YES, Message: "Well Done!"
        score = (60 - time) * num_words
        message = "well done!"
      else                                                          # if is NOT, give Message: "The word is not in the dictionary."
        message = "not an english word!"
        score = 0
      end
  else
      score = 0
      message = "not in the grid"
  end
  result = { time: time, score: score, message: message }

end








