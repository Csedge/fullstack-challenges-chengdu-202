def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  total = 0
  return -1 if min > max

  for i in (min..max) do
    total += i
  end
  return total
end

def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  n = min
  total = 0
  return -1 if min > max

  while n <= max
    total += n
    n += 1
  end
  return total
end
