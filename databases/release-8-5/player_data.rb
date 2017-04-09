require "sqlite3"
require_relative "game_data"

class PlayerData
  def initialize
    @db = SQLite3::Database.new("playerdata.db")
    @db.results_as_hash = true
    create_players_table
  end

  def create_players_table
    create_table_cmd = <<-SQL
      CREATE TABLE IF NOT EXISTS players (
        id INTEGER PRIMARY KEY,
        username VARCHAR(50),
        easy_streak INTEGER,
        med_streak INTEGER,
        hard_streak INTEGER,
        general_questions INTEGER,
        general_correct INTEGER,
        computer_questions INTEGER,
        computer_correct INTEGER,
        history_questions INTEGER,
        history_correct INTEGER,
        paused_game INTEGER
      );
    SQL
    @db.execute(create_table_cmd)
  end

  def new_player?(username)
    @username = username.capitalize
    @player_info = @db.execute("SELECT * FROM players WHERE username=\"#{@username}\";")
    return @player_info.empty?
  end

  def get_stats
    @player_info
  end

  def game_paused? #CLEANUP ON THIS AISLE
    puts paused = @db.execute("SELECT paused_game FROM players WHERE username=\"#{@username}\";")[0]["paused_game"]
    puts paused.class
    @userid = @db.execute("SELECT id FROM players WHERE username=\"#{@username}\";")[0]["id"]
    paused == 1
  end

  def add_player
    @db.execute("INSERT INTO players (username) VALUES (\"#{@username}\");")
    @userid = @db.execute("SELECT id FROM players WHERE username=\"#{@username}\";")["id"]
  end

  def update_stats(new_info)
    new_info.each do |key,value|
      next if key == "id" || key == "username" || value.nil?
      break if key.is_a? Integer
      if value.is_a? String
        puts update_str = "UPDATE players SET #{key}=\"#{value}\" WHERE username=\"#{@username}\";"
      else
        puts update_str = "UPDATE players SET #{key}=#{value} WHERE username=\"#{@username}\";"
      end
      @db.execute(update_str)
    end
  end

  def pause_game(category, difficulty, streak)
    today = Time.now
    today_str = "#{today.year}-#{today.month.to_s.rjust(2,"0")}-#{today.day.to_s.rjust(2,"0")}"
    game_arr = [today_str, category, difficulty, streak, @userid];
    game = GameData.new(@db)
    game.save_game(game_arr)
  end
end
