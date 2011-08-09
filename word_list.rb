WORD_ORDER = %w(j m b v n c z q x g f p l s r w d h t k)
TRUE_ORDER = %w(a b c d e f g h i j k l m n o p q r s t)

SORTED = []
SORTED_TRANS = []

def translate(word)
  translation = []
  word.each_char do |ch|
    translation << TRUE_ORDER[WORD_ORDER.index(ch)]
  end
  return translation.join(""), word
end

def insert_in_order(arr)
  translated = arr[0]
  original = arr[1]
  if SORTED.length == 0 then
    SORTED << original
    SORTED_TRANS << translated
    return
  else
    i = 0
    while(i < SORTED_TRANS.length)
      break if SORTED_TRANS[i] > translated
      i = i + 1
    end
    SORTED.insert(i, original)
    SORTED_TRANS.insert(i, translated)
  end
end

File.open("a.txt", "r") do |file|
  while (line = file.gets)
    line.split.each do |word|
      insert_in_order(translate(word))
    end
  end
end

puts SORTED.join(" ")
