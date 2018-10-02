def caesar_cipher (string, shift)
  string.split("").collect do |char|
    num = char.ord
    if num.between?(64, 91)
      num = ((num + shift - 65) % 26) + 65
    elsif num.between?(96, 123)
      num = ((num + shift - 97) % 26) + 97
    end
    char = num.chr
  end.join
end

puts caesar_cipher("Test!", 3)
puts caesar_cipher("Can it go backwards?", -5)
puts caesar_cipher("Handle end of range: X, y", 4)
