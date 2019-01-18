class Restaurant
  # TODO: add relevant accessors if necessary
  attr_accessor :new_rate, :average_rating
  attr_reader :city, :name

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @rating_record = []
    @average_rating = 0
  end

  # TODO: implement .filter_by_city and #rate methods
  def rate(new_rate)
    @rating_record << new_rate
    @average_rating = @rating_record.sum / @rating_record.size
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select { |restaurant| restaurant.city == city }
  end
end














# Restaurant
#   #average_rating
#     should implement #average_rating reader (FAILED - 1)
#   #rate
#     should update average restaurant rating (FAILED - 2)
#   #filter_by_city
#     should respond to filter_by_city method (FAILED - 3)
#     should filter by city existing restaurants (FAILED - 4)

# Failures:

#   1) Restaurant#average_rating should implement #average_rating reader
#      Failure/Error: expect(jules_verne).to respond_to :average_rating
#        expected #<Restaurant:0x00007ffeca104c28> to respond to :average_rating
#      # ./spec/restaurant_spec.rb:12:in `block (3 levels) in <top (required)>'

#   2) Restaurant#rate should update average restaurant rating
#      Failure/Error: bocuse.rate(rating)

#      NoMethodError:
#        undefined method `rate' for #<Restaurant:0x00007ffeca165190>
#      # ./spec/restaurant_spec.rb:21:in `block (4 levels) in <top (required)>'
#      # ./spec/restaurant_spec.rb:20:in `each'
#      # ./spec/restaurant_spec.rb:20:in `block (3 levels) in <top (required)>'

#   3) Restaurant#filter_by_city should respond to filter_by_city method
#      Failure/Error: expect(Restaurant).to respond_to :filter_by_city
#        expected Restaurant to respond to :filter_by_city
#      # ./spec/restaurant_spec.rb:29:in `block (3 levels) in <top (required)>'

#   4) Restaurant#filter_by_city should filter by city existing restaurants
#      Failure/Error: expect(Restaurant.filter_by_city(restos,"lyon")).to eq [bocuse]

#      NoMethodError:
#        undefined method `filter_by_city' for Restaurant:Class
#      # ./spec/restaurant_spec.rb:32:in `block (3 levels) in <top (required)>'

# Finished in 0.07364 seconds (files took 0.47909 seconds to load)
# 4 examples, 4 failures
