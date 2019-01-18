# class Meal
#   attr_accessor :id
#   attr_reader :name, :price

#   def initialize(attrs = {})
#     @id = attrs[:id]
#     @name = attrs[:name]
#     @price = attrs[:price]
#   end
# end

require_relative 'base_model'

class Meal < BaseModel
  attributes :name, :price

  # attribute :price, type: Integer
end
