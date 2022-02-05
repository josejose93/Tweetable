module TweetsHelper
  def capitalize_first_letter(word)
    word.split.map { |w| w.capitalize }.join(" ")
  end
end
