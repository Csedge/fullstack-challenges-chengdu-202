require_relative '../repositories/meal_repository'
require_relative '../views/meals_viewer'

class MealsController
  def initialize(repository)
    @repository = repository
    @view = MealsViewer.new
  end

  def list
    @view.display_menu(@repository.all)
  end

  def add
    name = @view.input_name
    price = @view.input_price
    meal = Meal.new(name: name, price: price)
    @repository.add(meal)
  end


end
