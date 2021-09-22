class Scrabble

  VALUES = { 1 => %w(A E I O U L N R S T), 
             2 => %w(D G),
             3 => %w(B C M P),
             4 => %w(F H V W Y),
             5 => %w(K),
             8 => %w(J X),
             10 => %w(Q Z)
           }

  def initialize(word)
    @word = word
  end

  def score
    score = 0
    return score if @word == nil
    arr = @word.upcase.chars
      arr.each do |char|
        VALUES.each do |number, array|
          score += number if array.include?(char)
      end
    end
    score
  end

  def self.score(word)
    w = Scrabble.new(word)
    w.score
  end

end