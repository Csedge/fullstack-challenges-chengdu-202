class Recipe
  attr_reader :name, :description, :prep_time
  attr_accessor :difficulty
  def initialize(name, description, prep_time) #difficulty = "easy")
    @name = name
    @description = description
    @prep_time = prep_time
    # @difficulty = difficulty
  end
end
