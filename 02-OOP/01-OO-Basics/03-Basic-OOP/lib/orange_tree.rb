class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_accessor :age, :height, :grow_fruits, :is_growing, :chance_to_die, :fruits, :dead

  def initialize
    @age = 0
    @dead = false
    @is_growing = true
    @height = 0
    @grow_fruits = false
    @fruits = 0
    # @is_fall_term = false
    @chance_to_die = 0
  end

  def one_year_passes!
    @height = height + 1 if @is_growing == true
    @age = age + 1 if @dead == false

    @grow_fruits = true if @age > 5
    @grow_fruits = false if @age >= 15

    @is_growing = false if @age >= 10

    @dead = true if @age == 100
    # self.produce_fruit!
    produce_fruit!
    return nil
  end

  def dead?
    @chance_to_die = 0 if @age <= 50
    @chance_to_die += 1 if @age >= 50
    @dead = true if rand(@chance_to_die..50) > 48 && chance_to_die.positive?

    return @dead
  end

  # def is_grow_fruits?
  #   return @grow_fruits
  # end


  # def height
  #   return @height
  # end

  # def is_fall_term?
  #   return @is_fall_term
  # end
  def produce_fruit!
    @fruits = 100 if grow_fruits == true && is_growing == true
    @fruits = 200 if grow_fruits == true && is_growing == false # @is_growing == (@age >= 10)
    @fruits = 0 if grow_fruits == false # @is_growing == (@age >= 10)
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits.positive? # && @is_fall_term == true
  end

  # def fall_term_comes!
  #   return @is_fall_term = true
  # end
end


