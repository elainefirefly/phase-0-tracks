require "sqlite3"

class PlayerData
  def initialize
    @db = SQLite3::Database.new("playerdata.db")
    @db.results_as_hash = true
  end

  def create_table
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
    @player_info = @db.execute("SELECT * FROM players WHERE username=\"#{username}\";")
    return @player_info.empty?
  end

  def game_paused?
  end

  def get_stats
  end

  def add_player
  end
end

playerdata = PlayerData.new
playerdata.create_table
puts playerdata.new_player?("hollerplayer")
