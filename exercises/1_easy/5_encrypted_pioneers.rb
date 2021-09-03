ALPHABET = ('a'..'z').to_a

def decrypt(string)
  result = []
  string.each_char do |char|
    result << ALPHABET[ALPHABET.find_index(char.downcase) - 13] if char != ' '
    result << ' ' if char == ' '
  end
  result.join
end

p ALPHABET

p decrypt('Nqn Ybirynpr')

#
# Nqn Ybirynpr
# if the input is included (0..12), then the output is (13..26)
# if the input is included in (13..26), then the output is in (0..12)
# iterate over each char in the string
# if the char matches the input (0..12), then find a match in the other part
# if the char matches the input (13..26), then find match in another group
# add the conversion to the results array
# concatenate the results array