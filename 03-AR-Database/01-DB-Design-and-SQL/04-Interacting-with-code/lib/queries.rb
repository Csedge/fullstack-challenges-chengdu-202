require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  # db.execute("SELECT COUNT(*) FROM artists").flatten.first
  db.execute("SELECT COUNT(*) FROM artists").flatten.first
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  db.execute("SELECT COUNT(*) FROM #{table_name}").flatten.first
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  artists = []
  artists = db.execute("SELECT name FROM artists ORDER BY name;").flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  love_songs = []
  love_songs = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%' ORDER BY name;").flatten
end

def long_tracks(db, min_length)
  long_tracks = []
  long_tracks = db.execute(
    "SELECT name FROM tracks
    WHERE milliseconds > #{min_length * 60_000}
    ORDER BY milliseconds ASC;"
  ).flatten
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
end
