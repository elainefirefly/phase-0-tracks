require_relative "headers"

class GameController
  def initialize
    @player_data = PlayerData.new
  end
  def get_username
    GameFace.greet
    username = gets.chomp
    check_username(username)
  end

  def check_username(name)
    new_player = @player_data.new_player?(name)
    if new_player
      @player_data.add_player
      get_preference
      #generate the questions
    else
      #show stats
      #check for paused game
        #if there is a paused game
          #get details of the paused game
          #generate the questions
        #if no paused game, start new game
          #get preferences from user
          #generate the questions
    end
  end

  def get_preference
      category = ask_category
      difficulty = ask_difficulty
      puts "category: #{category}"
      puts "difficulty: #{difficulty}"
      start_game(category, difficulty)
  end

  def ask_category(invalid=false)
    GameFace.prompt_not_valid if invalid
    GameFace.prompt_category
    category_str = gets.chomp
    category = case category_str.downcase
    when "a" then 9 #General Knowledge
    when "b" then 18 #Computer Science
    when "c" then 23 #History
    else
      invalid = true
      ask_category(invalid)
    end
  end

  def ask_difficulty(invalid=false)
    GameFace.prompt_not_valid if invalid
    GameFace.prompt_difficulty
    difficulty_str = gets.chomp
    difficulty = case difficulty_str.downcase
    when "a" then "easy"
    when "b" then "medium"
    when "c" then "hard"
    else
      invalid = true
      ask_difficulty(invalid)
    end
  end

  def start_game
  end
end
