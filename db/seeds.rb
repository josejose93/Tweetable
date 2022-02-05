require 'faker'

puts "Start Seeding"

puts "Creating Users..."

names = ["the great tanus", "son goku", "diego torres", "house on fire", "jose pablo"]

names.each do |name|
  user = User.new(username: name.split.join("_"), name: name, email: "#{name.split.join("_")}@mail.com" , password: "letmein")
  puts "User not created, Errors: #{user.errors.full_messages}" unless user.save
  
  puts "Createing Tweets for #{name}"
  rand(3..5).times do
    tweet = user.tweets.new(body: Faker::Quote.famous_last_words)
    puts "Tweet not created, Errors: #{tweet.errors.full_messages}" unless tweet.save
  end
end

users = User.all

puts "Creating comments"
15.times do
  user = users.sample
  tweet = user.tweets.sample
  comment = tweet.comments.new(user: tweet.user, body: Faker::Quote.yoda)
  puts "coment not created, Errors: #{comment.errors.full_messages}" unless comment.save
end
