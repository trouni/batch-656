class View
  def ask_for(something)
    puts "What is the #{something}?"
    print '> '
    gets.chomp
  end

  def ask_for_index
    puts "Which recipe? (Enter a number)"
    print '> '
    gets.chomp.to_i - 1
  end

  def display(recipes)
    puts "==== These are your recipes: ===="
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
    puts '---------------------------------'
  end
end