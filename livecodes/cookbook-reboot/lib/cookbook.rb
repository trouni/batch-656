require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = [] # array of instances of Recipe
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe) # recipe is an instance of Recipe
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # We don't want to push an array of strings, we want an instance of Recipe
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe| # recipe is an instance of Recipe
        csv << [recipe.name, recipe.description]
      end
    end
  end
end