require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @name = name
    @description = description
  end

  def all
    return @cookbook
  end

  def add_recipe(recipe)
    return recipe
  end

  def remove_recipe(recipe_index)
    return recipe_index
  end
end
