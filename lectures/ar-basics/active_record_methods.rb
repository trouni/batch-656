# CREATE
restaurant = Restaurant.new(name: 'Burger King')
restaurant.save

Restaurant.create(name: 'Burger King') # runs .new + .save

# READ
Restaurant.find(1)
Restaurant.find_by(name: 'Burger King') # returns the first match
# Restaurant.find_by_name('Burger King')

Restaurant.all # returns an array of restaurant instances

Restaurant.where(address: 'London') # always returns an array of instances
Restaurant.where('name LIKE ?', '%B%') # custom SQL as string argument
Restaurant.where.not(rating: (2..4))

Restaurant.first
Restaurant.last

# UPDATE
restaurant.rating = 5
restaurant.save

restaurant.update(name: 'Wendy\'s First Kitchen', rating: 3) # runs save as well

# DESTROY
restaurant.destroy
Restaurant.destroy_all

# ADVANCED
Restaurant.count
Restaurant.order(created_at: :desc)
Restaurant.group(:address).count
