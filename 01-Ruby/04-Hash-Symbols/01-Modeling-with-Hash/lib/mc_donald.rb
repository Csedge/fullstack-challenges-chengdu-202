FOOD_LIST = {
  'Hamburger': 250,
  'Cheese Burger': 300,
  'Big Mac': 540,
  'McChicken': 350,
  'French Fries': 230,
  'Salad': 15,
  'Coca Cola': 150,
  'Sprite': 150
}

def poor_calories_counter(burger, side, beverage)
  # TODO: return number of calories for this mcDonald order
  # p FOOD_LIST[burger.to_sym]
  # p FOOD_LIST.keys

  return FOOD_LIST[burger.to_sym] + FOOD_LIST[side.to_sym] + FOOD_LIST[beverage.to_sym]
end


# poor_calories_counter("Hamburger", "Big Mac", "Sprite")
