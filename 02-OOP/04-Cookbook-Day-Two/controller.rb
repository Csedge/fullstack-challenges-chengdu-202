require_relative 'recipe'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_tasks
  end

  def create
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
    display_tasks
  end

  def destroy
    display_tasks
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
    display_tasks
  end

  def display_tasks
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def input_ingredient
    ingredient = @view.ask_user_for_ingredient
    web_recipes_names = @cookbook.recipes_web(ingredient)
    @view.display_ingredient_result(web_recipes_names)
    import_recipe_web
  end

  def import_recipe_web
    index = @view.ask_user_for_recipe_web
    @cookbook.add_recipe(@cookbook.add_recipe_web(index))
  end
end
