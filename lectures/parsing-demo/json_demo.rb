require 'json'

filepath    = 'data/beers.json'

# READING / PARSING

serialized_beers = File.read(filepath)

beers_data = JSON.parse(serialized_beers)
pp beers = beers_data['beers']

beers.each do |beer|
  puts "#{beer['name']} is a #{beer['appearance']} beer from #{beer['origin']}"
end

# WRITING / STORING

beers = {
  beers: [
    {
      name:       'Edelweiss',
      appearance: 'White',
      origin:     'Austria'
    },
    {
      name:       'Guinness',
      appearance: 'Stout',
      origin:     'Ireland'
    },
  ]
}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end