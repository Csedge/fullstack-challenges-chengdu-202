def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  if number == 0
    return true
  elsif number == 1
    return true
  else
    number = number.to_s.split(//)
    number = number.map(&:to_i)
    number << (number[0] * number[1]) << (number[1] * number[2])
    detector = number.detect { |e| number.count(e) > 1 }
    return (detector == nil)
  end
end
