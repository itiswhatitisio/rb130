class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(list)
    sorted_word = word.downcase.chars.sort.join
    result = []
    list.map(&:downcase).map(&:chars).map(&:sort).map(&:join).each_with_index do |element, index|
      if element == sorted_word
        result << list[index]
      end
    end
    return result.sort if result.size == 1
    return [result.first] if result.map(&:downcase).map(&:chars).map(&:sort).map(&:join).uniq.size == 1
  end
end

detector = Anagram.new('corn')
p detector.match %w(corn dark Corn rank CORN cron park)