require "json"
require "rest-client"


# # TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.

# response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
# posts = JSON.parse(response).first(10)
# # => repos is an `Array` of `Hashes`.

# # repos.size
# # => 30



# # response = RestClient.get "https://hacker-news.firebaseio.com/v0/item/8863.json"


# # posts = JSON.parse(response).first(10)
# posts.each do |post|
#   reply = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{post}.json"
#   post = JSON.parse(reply)
#   post_data = Post.new(title: post[:title], url: post[:url], votes: post[:score])
#   post_data.save
# end




# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
repos = JSON.parse(response).first(10)

puts "Getting 10 posts..."

repos.each do |post|
  post_item = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{post}.json"
  post = JSON.parse(post_item)
  post_data = Post.new(title: post[:title].to_s, url: post[:url].to_s)
  post_data.save!
end

puts "Finished!"
