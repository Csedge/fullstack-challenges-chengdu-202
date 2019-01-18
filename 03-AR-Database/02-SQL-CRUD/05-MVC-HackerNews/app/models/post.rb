

class Post
  # TODO: Gather all code from all previous exercises
  # - reader and accessors
  # - initialize
  # - self.find
  # - self.all
  # - save
  # - destroy

  def initialize
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find
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
    post_title
  end

  def save
    if id == nil
      res_data = DB.execute("
        INSERT INTO posts (url, votes, title)
        VALUES ('#{@url}', '#{@votes}', '#{@title}')
        ").flatten
      return @id = DB.last_insert_row_id
    else
      res_data = DB.execute("
        UPDATE posts SET url = '#{url}', votes = '#{votes}', title = '#{title}'
        WHERE id = '#{id}'
        ").flatten
      return "'#{url}''#{votes}''#{title}' updated"
    end
  end

  def destory
    res_data = DB.execute("DELETE FROM posts WHERE id = #{id}").flatten
  end

end
