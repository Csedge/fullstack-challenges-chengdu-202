class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
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
end
