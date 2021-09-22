# Problem: determine if a triangle  is equilateral, isosceles, or scalene.
# An equilateral triangle has all three sides the same length.
# a = 3, b = 3, c = 3
# An isosceles triangle has exactly two sides of the same length.
# a = 2, b = 2, c = 3
# A scalene triangle has all sides of different lengths.
# a = 1, b = 2, c = 5

# For a shape to be a triangle at all, 
# all sides must be of length > 0, 
# and the sum of the lengths of any two sides must be greater than 
# the length of the third side.

class Triangle
  attr_reader :sides

  def initialize(a,b,c)
    @sides = [a, b, c]
    raise ArgumentError.new "Invalid triangle sides" unless real_triangle?
  end

  def real_triangle?
    all_sides = sides.all? { |side| side > 0 }
    all_sides && sides.max < sides.sum/2.0
  end

  def equilateral?
    real_triangle? && sides.uniq.size == 1
  end

  def isosceles?
    real_triangle? && sides.uniq.size == 2
  end

  def scalene?
    real_triangle? && sides.uniq.size == 3
  end

  def type
    return "This is not a triangle" if !real_triangle?
    return 'equilateral' if equilateral?
    return 'isosceles' if isosceles?
    return 'scalene' if scalene?
  end
end

triangle_equi = Triangle.new(1,2,1)
p triangle_equi.real_triangle?