class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    strand.split('').each_with_index do |gene1, i|
      other_strand.split('').each_with_index do |gene2, x|
        if gene1 != gene2 && i == x
          distance += 1
        end
      end
    end
   distance
  end
end

DNA.new('GACTACGGACAGGGTAGGGAAT').hamming_distance('GACATCGCACACC')