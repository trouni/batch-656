require 'json'
require 'open-uri'

puts 'Please enter a GitHub username:'
print '>'
username = gets.chomp

# TODO: - Let's fetch name and bio from a given GitHub username
url = "https://api.github.com/users/#{username}"

user_serialized = URI.open(url).read

user = JSON.parse(user_serialized)

puts "#{user['name']} is based in #{user['location']} and has #{user['public_repos']} public repos"
