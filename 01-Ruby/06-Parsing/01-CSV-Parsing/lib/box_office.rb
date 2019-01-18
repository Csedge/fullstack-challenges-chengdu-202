require 'csv'



def get_movies(file_path)
  movies_data = []
  CSV.foreach(file_path) do |row|
    # Here, row is an array of columns
    movies_data << { name: row[0], year: row[1].to_i, earnings: row[2].to_i }
  end
  return movies_data
end


def most_successful(number, max_year, file_path)
  movies_data = get_movies(file_path)
  # Sort by Earnings <key:(value)> in an array of Movies_data{}
  # "-movie" means give the output result in reverse
  movies_data = movies_data.sort_by { |movie| -movie[:earnings].to_i }
  movies_data = movies_data.select { |movie| movie[:year] < max_year }
  movies_data = movies_data.first(number)

end
