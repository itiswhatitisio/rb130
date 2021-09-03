class Diamond
  def self.make_diamond(end_letter)
    letters = ('A'..end_letter).to_a
    space_between = -1
    string = ''
    add_rows(letters, space_between, string)
  end

  def self.add_rows(letters, space_between, string)
    index = 0
    direction = 1

    loop do
      string << add_first_last_row(index, letters) if index.zero?
      string << add_middle_rows(index, letters, space_between) if index.positive?

      case direction
      when 1
        index += 1
        space_between += 2
      when -1
        index -= 1
        space_between -= 2
      end

      if index == letters.size
        direction = -1
        space_between -= 4
        index -= 2
      end

      break if index.negative?
    end

    string
  end

  def self.add_first_last_row(index, letters)
    first_last_row = ''
    first_last_row << ' ' * (letters.size - 1) + letters[index]
    first_last_row << ' ' * (letters.size - 1)
    first_last_row << "\n"
  end

  def self.add_middle_rows(index, letters, space_between)
    middle_row = ''
    middle_row << ' ' * (letters.size - index - 1) + letters[index]
    middle_row << ' ' * space_between + letters[index]
    middle_row << ' ' * (letters.size - index - 1)
    middle_row << "\n"
  end
end
