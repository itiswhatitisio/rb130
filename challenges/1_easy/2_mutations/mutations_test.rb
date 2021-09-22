require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'mutations'

class DNA_Test < Minitest::Test
  def setup
    @dna1 = DNA.new('GAGCCTACTAACGGGAT')
    @dna2 = DNA.new('CATCGTAATGACGGCCT')
  end

  def test_hamming_distance
    assert_equal 0, DNA.new('').hamming_distance('')
    assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
    assert_equal 3, DNA.new('ACT').hamming_distance('GGA')

    strand1 = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
    distance1 = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
    assert_equal 19, DNA.new(strand1).hamming_distance(distance1)
    assert_equal 1, DNA.new('GGACG').hamming_distance('GGTCG')
    assert_equal 2, DNA.new('ACCAGGG').hamming_distance('ACTATGG')
    assert_equal 3, DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')

    strand2 = 'GACTACGGACAGGGTAGGGAAT'
    distance2 = 'GACATCGCACACC'
    assert_equal 5, DNA.new(strand2).hamming_distance(distance2)

    dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')
    assert_equal 1, dna.hamming_distance('AGGCAA')
    assert_equal 4, dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
    assert_equal 1, dna.hamming_distance('AGG')
  end
end