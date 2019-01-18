# Very dirty code that needs refactoring...
def hop_hop_hop(number_of_exercises)
  counter = 0
  while counter != number_of_exercises
    counter += 1
    print "hop! " * counter + "One more time...\n"
  end

  # print 'One more time...'
  # for i in (1..number_of_exercises) do
  #   counter = 0
  #   until counter == i
  #     print "hop! "
  #     counter += 1
  #   end
  # puts 'One more time...' if counter == i
end

hop_hop_hop(6)
