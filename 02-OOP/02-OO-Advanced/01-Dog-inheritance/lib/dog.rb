class Dog
  def bark
    puts "woof woof"
  end
end

class GermanShepherd < Dog
end

german_shepherd = GermanShepherd.new
german_shepherd.bark
