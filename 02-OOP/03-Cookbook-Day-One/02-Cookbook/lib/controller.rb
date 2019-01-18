require_relative "recipe_view"
require_relative "cookbook"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = ViewCookbook.new(@cookbook)
  end

  def list
    @view.listing
  end

  def create
    recipe_name = @view.ask_name
    recipe_description = @view.ask_description
    recipe = Recipe.new(recipe_name, recipe_description)
    @cookbook.add_recipe(recipe)
    @view.listing
  end

  def destroy
    recipe_index = @view.index_delete
    @cookbook.remove_recipe(recipe_index)
    @view.listing
  end
end

