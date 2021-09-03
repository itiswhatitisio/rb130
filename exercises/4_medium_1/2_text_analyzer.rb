
class TextAnalyzer
  def process
    file = File.new('dante.txt', 'r')
    yield(file.read) if block_given?
    file.close
  end
end

# split the text based on the separator
# count the elements

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(" ").count} words" }