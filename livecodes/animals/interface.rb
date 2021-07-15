require_relative 'animal'
require_relative 'lion'
require_relative 'warthog'
require_relative 'meerkat'


animals = [Lion.new("Simba"), Lion.new("Kevin"), Warthog.new("Derek"), Meerkat.new("Sae")]

animals.each do |animal|
  puts animal.talk
end

