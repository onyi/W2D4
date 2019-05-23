def first_anagram?(word1, word2)
  letters1 = word1.split('')
  all_anagrams = permutations(letters1)
  all_anagrams.include?(word2.split(''))
end

def permutations(array)
  return [array] if array.length <= 1

  first = array.shift
 
  perms = permutations(array)

  total_permutations = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end
  total_permutations
end

def second_anagram?(word1, word2)
  letters = word2.split("")
  word1.each_char.with_index do |char, idx|
    return false if letters.index(char).nil?
    letters.delete_at(letters.index(char))
  end
  return letters.empty?
end
p second_anagram?("cat", "tac")
p second_anagram?("cat", "tax")

def third_anagram?(word1, word2)
  letters1 = jumble_sort(word1.split(''))
  letters2 = jumble_sort(word2.split(''))

  letters1 == letters2
end

def jumble_sort(array)
  alpha = ("a".."z").to_a
  sorted = false
  until sorted
    sorted = true
    (0...array.length - 1).each do |i|
      if alpha.index(array[i]) > alpha.index(array[i + 1])
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end
  array
end

p third_anagram?("cat", "tac")
p third_anagram?("cat", "tax")

def fourth_anagram?(word1, word2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  word1.chars.each do |char|
    hash1[char] += 1
  end
  word2.chars.each do |char|
    hash2[char] += 1
  end
  hash1 == hash2
end

p fourth_anagram?("cat", "tac")
p fourth_anagram?("cat", "tax")

def fifth_anagram?(word1, word2)
  hash = Hash.new(0)
  word1.chars.each do |char|
    hash[char] += 1
  end
  word2.chars.each do |char|
    hash[char] -= 1
  end
  hash.values.all? { |val| val.zero? }
end

p fifth_anagram?("cat", "tac")
p fifth_anagram?("cat", "tax")