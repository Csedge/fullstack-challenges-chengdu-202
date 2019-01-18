require "faker"
require_relative "../app/models/post"
require_relative "../app/models/user"


# 5.times do

#   post = Post.new(title: Faker::HeyArnold.character, url: Faker::Internet.url, votes: rand(1..5))
#   post.save
# end


5.times do
  puts "Creating a new user"
  user = User.new(username: Faker::SiliconValley.character,
                  email: Faker::SiliconValley.email)
  puts "Name: #{user.username}"
  puts "Email: #{user.email}"
  user.save!

  rand(5..10).times do
    puts "Creating a new post then assign the user"
    post = Post.new(name: Faker::SiliconValley.character,
                    url: Faker::SiliconValley.url,
                    votes: rand(0..10),
                    user: user)
    post.save!
  end
end
