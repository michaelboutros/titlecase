# Self-explanatory, I hope.
small_words = %w(a an and as at but by en for if in of on or the to via vs. vs v v.)
special_characters = %w(-^)

string = ARGV[0].split
string.map! do |word|
  word.strip!
  
  if [string.first, string.last].include?(word) then word.capitalize! end
  
  next(word) if small_words.include?(word)
  next(word) if special_characters.include?(word)
  next(word) if word =~ /[A-Z]/
  
  word = begin
    unless (match = word.match(/[#{special_characters.to_s}]/))
      word.sub(/\w/) { |letter| letter.upcase }
    else
      word.split(match.to_s).map! {|word| word.capitalize }.join(match.to_s)
    end
  end
end

puts string.join(' ')