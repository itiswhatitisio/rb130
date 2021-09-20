class Robot
  attr_reader :name

  @@names = []

  def name
    @name.nil? ? @name = generate_name : @name
    @name
  end

  def generate_name
    name = ''

    loop do
      2.times { name << ('A'...'Z').to_a.sample }
      3.times { name << (0...9).to_a.sample.to_s }
      break unless @@names.include?(name)
    end

    @@names << name
    name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end
end
