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
      get_preference(new_player)
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

  def get_preference(new)
    if new
      category = ask_category
      puts "category: #{category}"
      #GameFace.ask_difficulty
    end
  end

  def ask_category(invalid=false)
    GameFace.prompt_not_valid if invalid
    GameFace.prompt_category
    category_str = gets.chomp
    category = case category_str
    when "a" then 9 #General Knowledge
    when "b" then 18 #Computer Science
    when "c" then 23 #History
    else
      invalid = true
      ask_category(invalid)
    end
    category
  end


  def use_preference
    start_game
  end



  def start_game
  end
end
