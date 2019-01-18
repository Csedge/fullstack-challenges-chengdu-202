require_relative "recipe.rb"
require_relative "cookbook.rb"

class ViewCookbook
  def initialize(cookbook)
    @cookbook = cookbook
  end

  def listing
    @cookbook.all.each_with_index do |recipe, i|
      puts "#{i + 1}. #{recipe.name}"
    end
  end

  # creates a new recipe
  def ask_name
    listing
    puts "please input your recipe name"
    gets.chomp
  end

  def ask_description
    puts "please input your recipe description"
    # recipe_description =
    gets.chomp
  end

  def import_recipes
    puts "What ingredient would you like a recipe for?"
    gets.chomp
  end

  # destroys an existing recipe
  def index_delete
    listing
    puts "please type the index of the recipe you would like to delete"
    gets.chomp.to_i - 1
  end
end
