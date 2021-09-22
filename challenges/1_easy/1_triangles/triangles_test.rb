require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'triangles'

class TrianglesTest < MiniTest::Test
  def setup
    @triangle_equi = Triangle.new(4,4,4)
    @triangle_iso = Triangle.new(4,4,7)
    @triangle_sca = Triangle.new(2,3,4)
  end

  def test_type
    assert_equal('equilateral', @triangle_equi.type)
    assert_equal('isosceles', @triangle_iso.type)
    assert_equal('scalene', @triangle_sca.type)
  end

  def test_real_triangle?
    assert_equal(true, @triangle_equi.real_triangle?)
  end
end