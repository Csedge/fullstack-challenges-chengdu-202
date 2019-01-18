require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  detailed_tracks = db.execute("
    SELECT t.name, a.title, ar.name
    FROM tracks t
    JOIN albums a ON t.album_id = a.id
    JOIN artists ar ON a.artist_id = ar.id;
  ")
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  # stats_array = db.execute("
  #   SELECT g.name, COUNT(*), ROUND((AVG(t.milliseconds) / 60000),2)
  #   FROM tracks t
  #   JOIN genres g ON t.genre_id = g.id
  #   GROUP BY t.genre_id;
  #   ").flatten

  # stats_on = {
  #   avg_length: stats_array[2],
  #   category: stats_array[0],
  #   number_of_songs:stats_array[1]
  # }
  stats_on = {}
  stats_array = db.execute("
    SELECT g.name, COUNT(*), ROUND((AVG(t.milliseconds) / 60000),2)
    FROM tracks t JOIN genres g ON t.genre_id = g.id
    WHERE g.name = '#{genre_name}'
    ").flatten

  stats_on = {
    category: stats_array[0],
    number_of_songs: stats_array[1],
    avg_length: stats_array[2]
  }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<-SQL
  SELECT artists.name, COUNT(*) AS b
  FROM tracks
  JOIN genres ON genres.id = tracks.genre_id
  JOIN albums ON albums.id = tracks.album_id
  JOIN artists ON albums.artist_id = artists.id
  WHERE genres.name = "#{genre_name}"
  GROUP BY artists.name
  ORDER BY b DESC
  LIMIT 5
  SQL
  result = db.execute(query)
end







#   db.execute("SELECT COUNT(*) FROM artists").flatten.first


# def number_of_rows(db, table_name)
#   # TODO: count number of rows in table table_name
#   db.execute("SELECT COUNT(*) FROM #{table_name}").flatten.first
# end

# def sorted_artists(db)
#   # TODO: return array of artists' names sorted alphabetically
#   artists = []
#   artists = db.execute("SELECT name FROM artists ORDER BY name;").flatten
# end

# def love_tracks(db)
#   # TODO: return array of love songs' names
#   love_songs = []
#   love_songs = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%' ORDER BY name;").flatten
# end

# def long_tracks(db, min_length)
#   long_tracks = []
#   long_tracks = db.execute(
#     "SELECT name FROM tracks
#     WHERE milliseconds > #{min_length * 60_000}
#     ORDER BY milliseconds ASC;"
#   ).flatten
#   # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
# end
