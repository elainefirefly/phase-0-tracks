module GameFace

  def self.game_header
    system "clear" #clears the terminal
    puts
    puts "  KNOW YOUR STUFF GAME ".center(50, "  \u{1f31f} ")
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
    puts "(a) General Knowledge".prepend(" " * 10)
    puts "(b) Computer Science".prepend(" " * 10)
    puts "(c) History".prepend(" " * 10)
    puts
    puts "Type the letter of your choice:"
  end

  def self.prompt_difficulty
    game_header
    puts "How should we serve your questions?".center(50)
    puts "(a) Like how I want my eggs done, OVER EASY.".prepend(" " * 5)
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

  end

  def show_stats
    game_header

  end
end
