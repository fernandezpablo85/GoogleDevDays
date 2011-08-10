LETTERS = %w(j m b v n c z q x g f p l s r w d h t k)
COOLS = []

def num_value_of(word)
  value = 0
  word.chars.each_with_index do |char, i|
    char_value = LETTERS.index(char)
    pow = LETTERS.length ** i
    value = value + (char_value * pow)
  end
  value
end

def is_cool?(number)
  if number >= 741785 && number % 4 == 0 && !COOLS.include?(number) then
    COOLS << number
    return true
  else
    return false
  end
end

File.open("b.txt", "r") do |file|
  total = 0
  while (line = file.gets)
    line.split.each do |word|
      value = num_value_of(word)
      if is_cool?(value) then total = total + 1 end
    end
  end
  puts total
  puts COOLS.length == COOLS.uniq.length
end