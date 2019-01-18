# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Post
  # TODO
  # Add the initialize method to store the above columns in instance variables.
  # Add relevant readers & accessors.
  attr_accessor :title, :url, :votes
  attr_reader :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
    # TODO: store other attributes as instanced variable (exercise)
  end

  def self.find(id)
    return nil unless id.to_s.match?(/\A\d+\z/)     # prevent database injection && Valid id type:num.

    res_data = DB.execute("SELECT * FROM posts WHERE id = #{id}").flatten
    return nil if res_data.empty?                   # Return nil if database is empty

    attributes = {                                  # Re-formate the data
      # input: [1, "Hello world", nil, nil]
      id: res_data[0].to_i,
      title: res_data[1],
      url: res_data[2],
      votes: res_data[3].to_i
    }
    new(attributes)
  end

  def self.all
    DB.results_as_hash = true
    all_data = DB.execute("SELECT * FROM posts").flatten
    return [] if all_data.empty?
    post_title = []

    all_data.each do |keys|
      attributes = {
        id: keys[0].to_i,
        title: keys[1],
        url: keys[2],
        votes: keys[3].to_i
      }
      post_title << new(attributes)
    end
    p post_title
  end
end

