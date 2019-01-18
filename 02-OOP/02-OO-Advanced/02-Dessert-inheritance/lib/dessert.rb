class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @calories = calories
    @name = name
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr_reader :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    # if @flavor == "black licorice"
    #   return false
    # else
    #   return true
    # end
    @flavor != "black licorice"
  end
end





# 1) #quizz should understand #super behavior
#    Failure/Error: expect(quizz).to eq true

#      expected: true
#           got: false

#      (compared using ==)
#    # ./spec/bicycle_spec.rb:6:in `block (2 levels) in <top (required)>'



# 4) JellyBean inheritance should only extend Dessert with #flavor and #delicious?
#    Failure/Error: expect(JellyBean.instance_methods(false).sort).to match_array([:delicious?, :flavor])

#      expected collection contained:  [:delicious?, :flavor]
#      actual collection contained:    []
#      the missing elements were:      [:delicious?, :flavor]
#    # ./spec/dessert_spec.rb:29:in `block (3 levels) in <top (required)>'

# 5) JellyBean#flavor has a flavor getter
#    Failure/Error: expect(licorice_jelly.flavor).to eq "black licorice"

#    NoMethodError:
#      undefined method `flavor' for #<JellyBean:0x00007fa0080dcfc8>
#    # ./spec/dessert_spec.rb:35:in `block (3 levels) in <top (required)>'

# 6) JellyBean#healthy? inherits #healthy? from the Dessert class
#    Failure/Error: expect(licorice_jelly.healthy?).to eq true

#      expected: true
#           got: nil

#      (compared using ==)
#    # ./spec/dessert_spec.rb:41:in `block (3 levels) in <top (required)>'

# 7) JellyBean#delicious? has its own rules for deliciousness
#    Failure/Error: expect(licorice_jelly.delicious?).to eq false

#      expected: false
#           got: nil

#      (compared using ==)
# ./spec/dessert_spec.rb:48:in `block (3 levels) in <top (required)>'
