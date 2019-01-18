class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}: #{recipe.prep_time} minutes"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    return gets.chomp.to_i - 1
  end

  def ask_user_for_ingredient
    puts "What ingredient would you like a recipe for?"
    print "> "
    ingredient = gets.chomp.to_s
    puts "Looking for \"#{ingredient}\" on LetsCookFrench..."
    return ingredient
  end

  def display_ingredient_result(web_recipes_names)
    web_recipes_names.each_with_index do |e, i|
      puts "#{i + 1}. #{e}" if i <= 4
    end
    puts "[...] display only the first 5 results"
  end

  def ask_user_for_recipe_web
    puts "Which recipe would you like to import? (enter index)"
    print ">"
    index = gets.chomp.to_i
  end

end
