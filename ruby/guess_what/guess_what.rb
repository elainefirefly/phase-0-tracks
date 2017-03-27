#game processor
class GuessWhat
  attr_reader :phrase, :limit, :count, :guess_history, :guessed

  def initialize(phrase)
    @phrase = phrase
    @limit = phrase.scan(/[[:alpha:]]/).length
    @count = 0
    @guess_history = []
    @puzzle_bits = ["_"]
    @guessed = false
  end

  def valid?
    @phrase.scan(/[^a-z\s]/i).empty?
  end

  def construct_puzzle(indexes=[], letter="_")
    if indexes.empty? && letter == "_"
        phrase_hide = @phrase.gsub(/[a-z]/i, "_")
        phrase_hide.gsub!(" ", "|")
        @puzzle_bits = phrase_hide.split ""
    else
      indexes.each { |idx| @puzzle_bits[idx] = letter }
    end
    @puzzle_bits.join " "
  end

  def game_over?
    return true if !@puzzle_bits.include?("_") || guessed || @count == @limit
    false
  end

  def valid_letter?(letter)
    if letter.length == 1 && letter =~ /[a-z]/i && !@guess_history.include?(letter.downcase)
      @count += 1
      @guess_history << letter.downcase
      return true
    end
    false
  end

  def match_indexes(letter)
    idx_array = []
    @phrase.split('').each_with_index { |character,idx| idx_array << idx if character.downcase == letter }
    idx_array
  end
end
