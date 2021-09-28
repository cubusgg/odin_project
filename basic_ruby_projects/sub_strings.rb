# frozen_string_literal: true

def substrings(string, dictionary)
  dictionary.each_with_object(Hash.new(0)) do |word, result|
    matches = string.downcase.scan(word).length
    result[word] = matches unless matches.zero?
  end
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)

