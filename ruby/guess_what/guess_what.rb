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
      indexes.each { |idx| @puzzle_bits[idx] = letter.upcase }
    end
    @puzzle_bits.join " "
  end

  def over?
    return true if !@puzzle_bits.include?("_") || @guessed || @count == @limit
    false
  end

  def valid_letter?(letter)
    if letter.length == 1 && letter =~ /[A-Z]/i && !@guess_history.include?(letter.upcase)
      @count += 1
      @guess_history << letter.upcase
      return true
    end
    false
  end

  def match_indexes(letter)
    idx_array = []
    @phrase.split('').each_with_index { |character,idx| idx_array << idx if character.upcase == letter.upcase }
    idx_array
  end

  def check_guess(guess_phrase)
    @guessed = @phrase.upcase == guess_phrase.upcase
  end

  def won?
    if @guessed && @count <= @limit
      return true
    elsif @count <= @limit && !@puzzle_bits.include?("_")
      return true
    else
      return false
    end
  end
end


# Interface

module PromptDisplayer
  def self.get_phrase
    system "clear" #clears the terminal
    puts
    puts "  GUESS WHAT GAME ".center(50, "  \u{1f648} ")
    puts
    puts "Hello Game Master! We need the secret phrase.\nDon't show the guesser the screen just yet!".center(50)
    puts "Type the secret phrase, press enter when done: "
  end

  def self.invalid_phrase
    system "clear" #clears the terminal
    puts
    puts "  GUESS WHAT GAME  ".center(50, " \u{1f64a} ")
    puts
    puts "Secret phrase invalid. Use only the alphabet and space."
    puts "Try again. Type the secret phrase, then press enter:"
  end

  def self.pick_letter(puzzle,limit)
    puts
    puts "  HEY, GUESSER!  ".center(50, " \u{2b50} ")
    puts
    puts "#{puzzle}".center(50)
    puts
    puts "You have #{limit} guesses remaining"
    puts "Pick a letter:"
  end

  def self.invalid_letter(puzzle, limit)
    puts
    puts "  GIMME A LETTER ".center(50, " \u{2b50} ")
    puts
    puts "That was not a letter.".center(50)
    puts
    puts "#{puzzle}".center(50)
    puts
    puts "You have #{limit} guesses remaining"
    puts "Pick a letter:"
  end

  def self.no_match(puzzle,limit)
    puts
    puts "\u{1f613}  THAT LETTER IS NOT IN THE PUZZLE  \u{1f613}".center(50)
    puts
  end

  def self.repeated_letter(puzzle,limit)
    puts
    puts "\u{1f613}  AMNESIA? YOU PICKED THAT LETTER BEFORE.  \u{1f613}".center(50)
    puts
  end

  def self.guess_phrase(puzzle,limit)
    system "clear" #clears the terminal
    puts
    puts "   MATCH!  ".center(50, " \u{2b50} ")
    puts
    puts "#{puzzle}".center(50)
    puts
    puts "Can you guess the phrase?".center(50)
    puts
    puts "Type your guess:"
  end

  def self.wrong_phrase
    puts
    puts "  \u{1f61d}   NOPE. NOT THE SECRET PHRASE. \u{1f61d}".center(50)
    puts
  end

  def self.winner(phrase)
    system "clear" #clears the terminal
    puts
    puts "   WOOHOO! YOU GUESSED IT!  ".center(50, " \u{2b50} ")
    puts
    puts "Secret phrase: #{phrase}".center(50)
    puts
    puts " ".center(50, " \u{2b50} ")
    puts
  end

  def self.loser(phrase)
    system "clear" #clears the terminal
    puts
    puts "  NOT ROCKET SCIENCE  ".center(50, " \u{2b50} ")
    puts
    puts "\u{1f616}  You failed. \u{1f616}".center(50)
    puts "Secret phrase: #{phrase}".center(50)
    puts
    puts " ".center(50, " \u{2b50} ")
    puts
  end
end


#driver code (controller)
system "clear" #clears the terminal
# get phrase from game master
PromptDisplayer.get_phrase
phrase = gets.chomp
game = GuessWhat.new(phrase)
valid_phrase = game.valid?

# prompt game master if the phrase is not valid
until valid_phrase do
  PromptDisplayer.invalid_phrase
  phrase = gets.chomp
  game = GuessWhat.new(phrase)
  valid_phrase = game.valid?
end

puzzle = game.construct_puzzle
guess_remain = game.limit - game.count
# show the puzzle and ask for a letter
system "clear" #clears the terminal
until game.over? do
  PromptDisplayer.pick_letter(puzzle,guess_remain)
  letter_guess = gets.chomp
  # prompt guesser if the letter is not valid
  until game.valid_letter?(letter_guess) do
    if game.guess_history.include?(letter_guess.upcase)
      PromptDisplayer.repeated_letter(puzzle,guess_remain)
    else
      PromptDisplayer.invalid_letter(puzzle,guess_remain)
    end
    letter_guess = gets.chomp
  end
  # check if letter guess is a match
  guess_remain -= 1
  indexes = game.match_indexes(letter_guess)
  if indexes.empty?
    PromptDisplayer.no_match(puzzle,guess_remain)
  else
    puzzle = game.construct_puzzle(indexes,letter_guess)
    PromptDisplayer.guess_phrase(puzzle,guess_remain)
    phrase_guess = gets.chomp
    game.check_guess(phrase_guess)
    if game.guessed
      break
    else
      PromptDisplayer.wrong_phrase
    end
  end
end
# show the result
if game.won?
  PromptDisplayer.winner(phrase)
else
  PromptDisplayer.loser(phrase)
end
