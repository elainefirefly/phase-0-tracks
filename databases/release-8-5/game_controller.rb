require_relative "headers"

class GameController
  def initialize
    @player_data = PlayerData.new
    @streak = 0
  end

  def get_username
    GameFace.greet
    username = gets.chomp
    get_user_data(username)
  end

  def get_user_data(name)
    new_player = @player_data.new_player?(name)
    if new_player
      @player_data.add_player
      @analyzer = GameAnalyzer.new(@player_data.get_stats)
      get_preference(new_player)
    else
      @analyzer = GameAnalyzer.new(@player_data.get_stats)
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
      ask_category
      ask_difficulty
      start_game
    else
    end
  end

  def ask_category(invalid=false)
    GameFace.prompt_not_valid if invalid
    GameFace.prompt_category
    category_str = gets.chomp
    @category = case category_str.downcase
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
    @difficulty = case difficulty_str.downcase
    when "a" then "easy"
    when "b" then "medium"
    when "c" then "hard"
    else
      invalid = true
      ask_difficulty(invalid)
    end
  end

  def start_game(qty=10)
    questions = Questions.new(@category, @difficulty)
    questions.generate(qty)
    qty.times do |n|
      @question = questions.next_question(n)
      @choices = questions.give_choices(n)
      player_answer = get_answer
      puts "answer: #{player_answer}"
      correct_answer = questions.reveal_answer
      give_result(player_answer, correct_answer)
    end
    update_standing
    #update stats
  end

  def get_answer(invalid=false)
    GameFace.prompt_question(@question, @choices)
    answer_str = gets.chomp
    answer = case answer_str.downcase
    when "a" then 0
    when "b" then 1
    when "c" then 2
    when "d" then 3
    else
      invalid = true
      get_answer(invalid)
    end
  end

  def give_result(player_answer, right_answer)
    if player_answer == right_answer
      @streak += 1
      correct = true
    else
      @streak = 0
      correct = false
    end
    GameFace.prompt_answer(correct, @streak, @question, @choices, right_answer, player_answer)
  end

  def update_standing
    if @analyzer.get_best_streak(@difficulty)
    end
  end
end
