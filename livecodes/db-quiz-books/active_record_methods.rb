# 1. Add your favorite author to the DB
new_author = Author.new(name: 'Viddy')
new_author.save

# 2. Get all authors
Author.all

# 3. Get author with id=8
Author.find(8)
# ❌ Author.find(id: 8)
# ❌ Author.find_by(id: 8)

# 4. Get author with name="Jules Verne", store it in a variable: jules
jules = Author.find_by(name: 'Jules Verne') # => an instance of author
# ❌ Author.find(name: 'Jules Verne')
# ❌ Author.find_by(name = 'Jules Verne')
# ❌ Author.find_by('name', 'Jules Verne')
# ❌ Author.where(name: 'Jules Verne') # => array of authors

# 5. Get Jules Verne's books
jules.books

# 6. Create a new book "20000 Leagues under the Seas", it's missing in DB.
# Store it in a variable: twenty_thousand
twenty_thousand = Book.new(title: "20000 Leagues under the Seas", year: 1870)
# twenty_thousand.save
# # Book.create(title: "20000 Leagues under the Seas", year: 1870)

# 7. Add Jules Verne as this book's author
twenty_thousand.author = jules # we need to pass an instance of Author
# ❌ twenty_thousand.author = 'Jules Verne'

# 8. Now save this book in the DB!
twenty_thousand.save
