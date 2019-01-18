class MealsViewer
  def initialize
  end

  def display_menu(meals)
    meals.each do |meal|
      puts "#{meal.id}, #{meal.name}, #{meal.price}"
    end
  end

  def input_name
    puts "Name: >"
    gets.chomp
  end

  def input_price
    puts "Price: >"
    gets.chomp.to_i
  end
end
