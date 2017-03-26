#game processor
class GuessWhat
  attr_reader :phrase, :limit, :count, :guess_list, :guessed

  def initialize(phrase)
    @phrase = phrase
    @limit = phrase.scan(/[[:alpha:]]/).length
    @count = 0
    @guess_list = []
    @puzzle_bits = ["_"]
    @guessed = false
  end

  def valid?
    @phrase.scan(/[^a-zA-Z\s]/).empty?
  end

  def show_puzzle(indexes=[], letter="_")
    if indexes.empty? && letter == "_"
        phrase_hide = @phrase.gsub(/[a-zA-Z]/, "_")
        phrase_hide.gsub!(" ", "|")
        @puzzle_bits = phrase_hide.split ""
    end
    @puzzle_bits.join " "
  end

  def game_over?
    return true if !@puzzle_bits.include?("_") || guessed || @count == @limit
    false
  end
end
