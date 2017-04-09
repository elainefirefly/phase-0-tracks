require "sqlite3"

class PlayerData
  def initialize
    @db = SQLite3::Database.new("playerdata.db")
    @db.results_as_hash = true
    create_players_table
    create_games_table
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

  def create_games_table
    create_table_cmd = <<-SQL
      CREATE TABLE IF NOT EXISTS games (
        id INTEGER PRIMARY KEY,
        play_date VARCHAR(20),
        category INTEGER,
        difficulty VARCHAR(10),
        streak INTEGER,
        player_id INTEGER,
        FOREIGN KEY (player_id) REFERENCES players(id)
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

  def game_paused?
    paused = @db.execute("SELECT paused_game FROM players WHERE username=\"#{@username}\";")
    paused == 1
  end

  def add_player
    @db.execute("INSERT INTO players (username) VALUES (\"#{@username}\");")
    @userid = ("SELECT id FROM players WHERE username=\"#{@username}\";")
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

  def pause_game
    
  end
end

playerdata = PlayerData.new
puts playerdata.new_player?("hollerplayer")
if playerdata.new_player?("CoCoChanel")
  playerdata.add_player("CoCoChanel")
else
  puts false
end
puts playerdata.game_paused?
puts playerdata.get_stats
hash_info = {"id"=>1, "username"=>"Cocochanel", "easy_streak"=>25, "med_streak"=>25, "hard_streak"=>15, "general_questions"=>10, "general_correct"=>20, "computer_questions"=>nil, "computer_correct"=>nil, "history_questions"=>nil, "history_correct"=>16, "paused_game"=>1, 0=>1, 1=>"Cocochanel", 2=>nil, 3=>nil, 4=>nil, 5=>nil, 6=>nil, 7=>nil, 8=>nil, 9=>nil, 10=>nil, 11=>nil}
playerdata.update_stats(hash_info)
puts playerdata.get_stats
