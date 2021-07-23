require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

puts '=== READ (ONE) ==='
task = Task.find(1)
puts "#{task.title} [#{task.done ? 'X' : ' '}] #{task.description}"

puts '=== CREATE ==='
task = Task.new(title: 'Not get caught drinking beer', description: 'Drink quietly')
task.save
puts task.id

puts '=== UPDATE ==='
task = Task.find(3)
task.done = true
task.save
puts "#{task.title} [#{task.done ? 'X' : ' '}] #{task.description}"

puts '=== READ (ALL) ==='
tasks = Task.all
tasks.each do |task|
  puts "#{task.title} [#{task.done ? 'X' : ' '}] #{task.description}"
end

puts '=== DESTROY ==='
task = Task.find(2)
task.destroy

tasks = Task.all
tasks.each do |task|
  puts "#{task.title} [#{task.done ? 'X' : ' '}] #{task.description}"
end

puts '=== SUCCESS!!!!! 🍻🍻🍻 ==='