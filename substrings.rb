def substrings(string, substring_arr)
  retrievals = Hash.new(0)
  string.downcase!
  substring_arr.each do |substr|
    retrievals[substr] += string.scan(substr).count if string.include?(substr)
  end
  retrievals
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
