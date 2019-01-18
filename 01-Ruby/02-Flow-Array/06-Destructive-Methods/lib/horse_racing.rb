def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
  race_array.reverse!
  # for i in 0..(race_array.size - 1)
  #   race_array[i] = "#{race_array.size - i}-#{race_array[i]}!"
  # end

  # i = 0
  # race_array.each do |horse|
  #   # horse = "#{race_array.length - i}-" + horse + '!'

  #   horse.prepend("#{race_array.length - i}-")

  #   # [1,2,3] << 4 # [1,2,3,4]
  #   # 'hello' << 'world' # 'helloworld'
  #   horse << '!'
  #   # horse += '!' # horse = horse + '!'

  #   i += 1
  # end

  (0...race_array.length).each do |i|
    race_array[i] = "#{race_array.length - i}-" + race_array[i] + '!'
  end

  # race_array.map! do |horse|
  #   new_horse = "#{race_array.length - i}-" + horse + '!'
  #   i += 1
  #   new_horse
  # end

  # puts horse


  # x = race_array.size


  # race_array.each do |i|
  #   race_array[i] = x.to_s + "-" + i
  #   x = x - 1
  # end
end




