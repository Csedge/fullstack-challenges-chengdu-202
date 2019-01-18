def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

MEALS_CALORIES = {
  "Happy Meal" => poor_calories_counter("Cheese Burger", "French Fries", "Coca Cola"),
  "Best Of Big Mac" => poor_calories_counter("Big Mac", "French Fries", "Coca Cola"),
  "Best Of McChicken" => poor_calories_counter("McChicken", "Salad", "Sprite")
}


def calories_counter(orders)
  # TODO: return number of calories for a less constrained order
  sum = 0
  # Grab each item in the orders array
  orders.map do |order|
    if DISHES_CALORIES.key?(order)  # If the order is from MEALS_CALORIES:
      sum += DISHES_CALORIES[order]
    else                            # If the order is from DISHES_CALORIES:
      sum += MEALS_CALORIES[order]
    end
  end
  # p sum
  return sum
end

# calories_counter(["Big Mac", "French Fries", "Happy Meal", "Coca Cola"])
# calories_counter(["Happy Meal"])
