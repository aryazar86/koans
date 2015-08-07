# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  array = [a,b,c].sort! { |x,y| y <=> x }
  
  if array.include?(0)
    raise TriangleError, "A triangle should not have any sides of length 0."
  elsif (array.map {|a| a < 0}).size > 0
    raise TriangleError, "Negative length doesn't make sense."
  elsif array[0] <= array[1] + array[2]
    raise TriangleError, "Any two sides of a triangle should add up to more than the third side."
  elsif(array.uniq.size == 1)
    return :equilateral
  elsif(array.uniq.size == 2)
    return :isosceles
  else
    return :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
