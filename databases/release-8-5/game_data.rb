require "sqlite3"

class GameData
  def initialize(db)
    @db = db
    create_games_table
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

  def save_game(game_info)
    game_info.each_with_index { |val,i| game_info[i] = "\"#{val}\"" if i == 0 || i == 2}
    values_str = game_info.join ","
    puts insert_str = "INSERT INTO games (play_date, category, difficulty, streak, player_id) VALUES (#{values_str});"
    @db.execute(insert_str)
  end
end
