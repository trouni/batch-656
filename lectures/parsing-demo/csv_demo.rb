require 'csv'

filepath    = 'data/beers.csv'

# READING / PARSING

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

CSV.foreach(filepath, csv_options) do |row|
  p row['Origin']
  # Here, row is an array of columns
  # puts "#{row[0]} | #{row[1]} | #{row[2]}"
end

# WRITING / STORING

csv_options = { col_sep: ',', quote_char: '"', force_quotes: true }

beers = [
  { name: 'Edelweiss', appearance: 'White', origin: 'Austria' },
  { name: 'Cuvée des Trolls', appearance: 'Blond', origin: 'Belgium' },
  { name: 'Choulette Ambrée', appearance: 'Amber', origin: 'France' },
  { name: 'Gulden Draak', appearance: 'Dark', origin: 'Belgium' }
]

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end