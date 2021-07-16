require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @view = View.new
    @cookbook = cookbook
  end

  def create
    # Tell view to ask user for name
    name = @view.ask_for('recipe name')
    # Ask for a description
    description = @view.ask_for('recipe description')
    # Create the recipe
    recipe = Recipe.new(name, description)
    # Store the recipe in the cookbook
    @cookbook.add_recipe(recipe)
  end

  def list
    display_recipes
  end

  def destroy
    # Display the recipes
    display_recipes
    # Ask which one to destroy? (index)
    index = @view.ask_for_index
    # Remove the recipe from the cookbook
    @cookbook.remove_recipe(index)
  end

  private

  def display_recipes
    # Retrieve the recipes from the cookbook
    recipes = @cookbook.all
    # Display the recipes
    @view.display(recipes)
  end
end