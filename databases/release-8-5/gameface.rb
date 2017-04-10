module GameFace

  def self.game_header(emoji="\u{1f31f}")
    system "clear" #clears the terminal
    puts
    puts "  KNOW YOUR STUFF GAME ".center(50, "  #{emoji} ")
    puts
  end

  def self.greet
    game_header
    puts "What's your username?".center(50)
    puts
    puts "Enter username or enter a new one, if this is your first time:"
    puts
  end

  def self.prompt_category
    game_header
    puts "Which stuff do you know best?".center(50)
    puts
    puts "(a) General Knowledge".prepend(" " * 10)
    puts "(b) Computer Science".prepend(" " * 10)
    puts "(c) History".prepend(" " * 10)
    puts
    puts "Type the letter of your choice:"
  end

  def self.prompt_difficulty
    game_header
    puts "How should we serve your questions?".center(50)
    puts
    puts "(a) Like how I want my eggs done – over EASY.".prepend(" " * 5)
    puts "(b) I want just a happy MEDIUM.".prepend(" " * 5)
    puts "(c) I eat HARD boiled difficult for breakfast.".prepend(" " * 5)
    puts
    puts "Type the letter of your choice:"
  end

  def self.prompt_not_valid
    game_header
    puts "\u{1f645}  UH-OH! That is not a valid input \u{1f645}".center(50)
    puts
    puts "Press ENTER to continue...".center(50)
    gets
  end

  def self.prompt_question(question, choices)
    game_header
    puts "Question: #{question}".center(50)
    puts
    letter = "a"
    choices.each do |choice|
      puts "(#{letter}) #{choice}".prepend(" " * 10)
      letter.next!
    end
    puts
    puts "Type the letter of your choice:"
  end

  def self.prompt_answer(correct, curr_streak, question, choices, a_idx, p_idx)
    letter = %w{a b c d}
    congratulate = ["You got it!", "That's right!", "Awesome answer!", "Score!", "Genius! Way to go!", "Hey walking Wiki!"]
    shame = ["We thought you can handle it...", "You just lost your streak... neener neener", "It must be tough to be you...", "How can you not know that???"]
    game_header
    if correct
      puts "\u{1f647}  #{congratulate.sample} \u{1f647}".center(50)
      puts
      puts "Your answer \"(#{letter[p_idx]}) #{choices[p_idx]}\" to ".center(50)
      puts "\"#{question}\" is correct!".center(50)
      puts "Your current streak is: #{curr_streak}".center(50)
      puts
      puts "Press ENTER to continue...".center(50)
      gets
    else
      puts "\u{1f481}  #{shame.sample} \u{1f481}".center(50)
      puts
      puts "The correct answer to the question:".center(50)
      puts "\"#{question}\"".center(50)
      puts "is \"(#{letter[a_idx]}) #{choices[a_idx]}\"".center(50)
      puts
      puts "Press ENTER to continue...".center(50)
      gets
    end
  end

  def self.prompt_fantastic
    game_header("\u{1f3c6}")
    puts "You have answered 10 questions. Good going!"
    puts "You achieved #{curr_streak} streak."
    puts "You beat your personal best of #{best_strk}"
    puts "for this level and category."

    puts "Press ENTER to continue...".center(50)
    gets
  end

  def self.prompt_not_enough
    game_header("\u{1f64a}")
    puts "You have answered 10 questions but no banana".center(50)
    puts "Your current streak is less than your personal best".center(50)
    puts "for this level and category".center(50)

    puts "Press ENTER to continue...".center(50)
    gets


  def show_stats
    game_header
  end
end
