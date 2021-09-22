# generate a beer song
# input: start verse, start and end verse, lyrics


class BeerSong

  def self.verse(total, *final)
    Verse.new(total, *final)
  end

  def verses
  end

  def lyrics
  end
end

class Verse
  attr_accessor :start_bottles, :end_bottles

  def initialize(total, *final)
    @start_bottles = total
    final.empty? ? @end_bottles = total - 1 : @end_bottles = final.first
    generate
  end

  def generate
    loop do
      puts "#{start_bottles} bottles of beer on the wall, #{start_bottles} bottles of beer.\n"
      self.start_bottles = start_bottles - 1
      puts "Take one down and pass it around, #{start_bottles} bottles of beer on the wall.\n"
      break if start_bottles == end_bottles
    end
  end

end

test = BeerSong.verse(99)
p test
expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n"
      p test == expected