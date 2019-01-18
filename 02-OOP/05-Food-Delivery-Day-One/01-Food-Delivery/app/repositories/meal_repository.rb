require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  private

  def headers
    %w{ id name price }
  end

  def serialize(element)
    [element.id, element.name, element.price]
  end

  def deserialize(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
