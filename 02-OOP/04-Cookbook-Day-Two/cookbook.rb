require "csv"
require_relative 'recipe'
require 'nokogiri'
require 'open-uri'

class Cookbook
  def initialize(csv_file_path)
    # which loads existing Recipe from the CSV
    @recipes = []
    # @csv_options = { col_sep: "," }
    @csv_file_path = csv_file_path
    load_csv
    @web_recipes_names = []
    @web_recipes_urls = []
    # CSV.foreach(@csv_file_path) do |row|
    #   recipe = Recipe.new(row[0], row[1])
    #   @recipes << recipe
  end

  def all
    # which returns all the recipes.csv
    @recipes
  end

  def add_recipe(recipe)
    # which adds a new recipe to the cookbook
    @recipes << recipe
    # @csv_options = { col_sep: ","}
    save_to_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv
    # which removes a recipe from the cookbook.
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2])
    end
  end

  def save_to_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def recipes_web(ingredient)
    @web_recipes_names = []
    @web_recipes_urls = []
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('.m_titre_resultat a').each do|element|
      @web_recipes_names << element.attribute('title').value
      @web_recipes_urls << element.attribute('href').value
    end
    return @web_recipes_names
  end

  def add_recipe_web(index)
    recipe = []
    recipes_url = @web_recipes_urls[index - 1]
    url = "http://www.letscookfrench.com#{recipes_url}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('span.preptime').each do |element|
      recipe = Recipe.new(@web_recipes_names[index - 1], "Preperation time:  #{element.text.strip}", "#{element.text.strip}")
    end
    recipe
  end
end
