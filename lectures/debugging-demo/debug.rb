# require 'pry-byebug'

def full_name(first, last)
  # binding.pry
  first_name = first.capitalize
  last_name = last.capitalize

  # binding.pry
  "#{first_name} #{last_name}"
end

puts full_name("kevin", "koncZak")

# 1. gem install pry-byebug (once)
# 2. require 'pry-byebug' at the top of the file
# 3. add binding.pry wherever you want to stop and inspect the code