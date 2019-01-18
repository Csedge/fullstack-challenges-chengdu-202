require 'csv'

class Cookbook
  def initialize(csv_file_filepath)
    @csv_file_filepath = csv_file_filepath
    @cookbook = []
    CSV.foreach(@csv_file_filepath) do |csv|
      @cookbook << Recipe.new(csv[0], csv[1])
    end
  end

  def all
    return @cookbook
  end

  def add_recipe(recipe)
    @cookbook << recipe
    CSV.open(@csv_file_filepath, 'wb') do |csv|
      @cookbook.each do |item|
        csv << [item.name, item.description]
      end
    end
  end

  def remove_recipe(recipe_index)
    @cookbook.delete_at(recipe_index)
    CSV.open(@csv_file_filepath, 'wb') do |csv|
      @cookbook.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end




