FOO = %w(t m q h r)
prepositions = []
verbs = []
first_person_verbs = []

def ends_with_foo_letter?(word)
  FOO.any? {|foo_letter| word.end_with?(foo_letter)}
end

def starts_with_bar_letter?(word)
  FOO.all? {|foo_letter| !word.start_with?(foo_letter)}
end

def is_preposition?(word)
  word.length == 4 && ends_with_foo_letter?(word) && !word.include?("h")
end

def is_verb?(word)
  word.length >= 8 && ends_with_foo_letter?(word)
end

File.open("a.txt", "r") do |file|
  while (line = file.gets)
    line.split.each do |word|
      
      prepositions << word if is_preposition?(word)
      verbs << word if is_verb?(word)
      first_person_verbs << word if is_verb?(word) && starts_with_bar_letter?(word)
      
    end
  end
end

puts prepositions.count
puts verbs.count
puts first_person_verbs.count