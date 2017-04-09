module GameFace

  def self.greet
    system "clear" #clears the terminal
    puts
    puts "  KNOW YOUR STUFF GAME ".center(50, "  \u{1f648} ")
    puts
    puts "What's your username?".center(50)
    puts
    puts "Enter username or enter a new one, if this is your first time:"
    puts
  end

  def self.prompt_category
    system "clear" #clears the terminal
    puts
    puts "  KNOW YOUR STUFF GAME ".center(50, "  \u{1f31f} ")
    puts
    puts "Which category would you like to play?".center(50)
    puts "Type (a) General Knowledge".prepend(" " * 10)
    puts "Type (b) Computer Science".prepend(" " * 10)
    puts "Type (c) History".prepend(" " * 10)
    puts
    puts "Type the letter of your choice:"
  end

  def self.prompt_not_valid
    system "clear" #clears the terminal
    puts
    puts "  KNOW YOUR STUFF GAME ".center(50, "  \u{1f645} ")
    puts
    puts "UH-OH! That is not a valid input".center(50)
    puts
    puts "Press ENTER to continue...".center(50)
    puts
    gets
  end

  def show_stats

  end
end
