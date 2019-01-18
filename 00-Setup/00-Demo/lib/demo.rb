def circle_area(radius)
  if radius.negative?
    return 0
  else
    return 3.14 * radius**2
  end
end
