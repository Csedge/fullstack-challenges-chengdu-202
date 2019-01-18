class Viewer

  def ask_for_username
    puts "> username?"
    gets.chomp
  end

  def ask_for_password
    puts "> password?"
    gets.chomp
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}, #{meal.price}"
    end
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}, #{customer.address}"
    end
  end

  def ask_user_for(info)
    puts "what is the #{info} of your meal?"
    return gets.chomp
  end

  def ask_customer_for(info)
    puts "what is the your #{info}?"
    return gets.chomp
  end

  def ask_user_for_meal_id
    puts "please insert meal id"
    gets.chomp
  end

  def ask_user_for_customer_id
    puts "please insert customer id"
    return gets.chomp
  end

  def ask_user_for_employee_id
    puts "please insert customer id"
    return gets.chomp
  end

  def ask_delivery_guy_for_order_id
    puts "please put order id"
    return gets.chomp
  end
end
