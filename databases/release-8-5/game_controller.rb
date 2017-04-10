require_relative "headers"

class GameController
  def initialize
    @player_data = PlayerData.new
    @streak = 0
    @question_count = 0
    @correct_count = 0
    @info_bank = {}
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
      display_stats
      game_paused = @player_data.game_paused?
      get_game_info if game_paused
      #check for paused game
        #if there is a paused game
          #get details of the paused game
          #generate the questions
        #if no paused game, start new game
          #get preferences from user
          #generate the questions
    end

  end

  def display_stats
    @analyzer = GameAnalyzer.new(@player_data.get_stats)
    GameFace.prompt_show_stats(@analyzer.report_summary)
  end

  def get_preference(new)
    if new
      ask_category
      ask_difficulty
      start_game
    else
    end
  end

  def get_game_info
    game_info = @player_data.get_game
    puts game_info
  end

  def ask_category
    GameFace.prompt_not_valid if invalid
    GameFace.prompt_category
    category_str = gets.chomp
    @category = case category_str.downcase
    when "a" then 9 #General Knowledge
    when "b" then 18 #Computer Science
    when "c" then 23 #History
    else
      ask_category
    end
    @info_bank["category"] = @category
  end

  def ask_difficulty
    GameFace.prompt_not_valid if invalid
    GameFace.prompt_difficulty
    difficulty_str = gets.chomp
    @difficulty = case difficulty_str.downcase
    when "a" then "easy"
    when "b" then "medium"
    when "c" then "hard"
    else
      ask_difficulty
    end
    @info_bank["difficulty"] = {@difficulty}
  end

  def start_game(qty=10)
    questions = Questions.new(@category, @difficulty)
    questions.generate(qty)
    qty.times do |n|
      @question_count += 1
      @question = questions.next_question(n)
      @choices = questions.give_choices(n)
      player_answer = get_answer
      correct_answer = questions.reveal_answer
      give_result(player_answer, correct_answer)
    end
    update_standing
  end

  def get_answer
    GameFace.prompt_question(@question, @choices)
    answer_str = gets.chomp
    answer = case answer_str.downcase
    when "a" then 0
    when "b" then 1
    when "c" then 2
    when "d" then 3
    else
      get_answer
    end
  end

  def give_result(player_answer, right_answer)
    if player_answer == right_answer
      @streak += 1
      @correct_count += 1
      correct = true
    else
      @streak = 0
      correct = false
    end
    GameFace.prompt_answer(correct, @streak, @question, @choices, right_answer, player_answer)
  end

  def update_standing
    key = case @difficulty
    when "easy" then "easy_streak"
    when "medium" then "med_streak"
    when "hard" then "hard_streak"
    end
    if @info_bank[key] == nil
      personal_best = @analyzer.get_best_streak(@difficulty)
    else
      personal_best = @info_bank[key]
    end
    if personal_best < @streak
      GameFace.prompt_fantastic(@streak, personal_best)
      @info_bank[key] = @streak
    else
      GameFace.prompt_not_enough
    end
    ask_new_round
  end

  def ask_new_round
    GameFace.prompt_new_round
    continue = gets.chomp
    case continue.downcase
    when "y" then start_game
    when "n" then pause_game
    else
      ask_new_round
    end
  end

  def tally_questions
    key = case @category
    when 9 then "general_questions"
    when 18 then "computer_questions"
    when 23 then "history_questions"
    end
    @stat = @player_data.get_stats
    @question_count += @stat[key]
    @info_bank[key] = @quesiton_count
  end

  def tally_answers
    key = case @category
    when 9 then "general_correct"
    when 18 then "computer_correct"
    when 23 then "history_correct"
    end
    @question_count += @stat[key]
    @info_bank[key] = @correct_count
  end

  def pause_game
    @info_bank["paused_game"] = 1
    save_game
  end

  def save_game
    @player_data.pause_game(@category, @difficulty, @streak)
    key = tally_questions
    tally_answers
    @player_data.update_stats(@info_bank)
  end
end
