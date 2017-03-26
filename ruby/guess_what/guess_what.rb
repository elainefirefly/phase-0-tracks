#game processor
class GuessWhat
  attr_reader :phrase, :limit, :count, :guesses

  def initialize(phrase)
    @phrase = phrase
    @limit = phrase.scan(/[[:alpha:]]/).length
    @count = 0
    @guesses = []
  end

  def valid?
    @phrase.scan(/[^a-zA-Z\s]/).empty?
  end
end
