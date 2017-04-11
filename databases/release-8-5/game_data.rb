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

  def save_game(game_info, new_flag)
    no_player_id = @db.execute("SELECT * FROM games WHERE player_id=#{game_info[-1]};").empty?
    if new_flag || no_player_id
      game_info.each_with_index { |val,i| game_info[i] = "\"#{val}\"" if i == 0 || i == 2}
      values_str = game_info.join ","
      insert_str = "INSERT INTO games (play_date, category, difficulty, streak, player_id) VALUES (#{values_str});"
      @db.execute(insert_str)
    else
      key_arr = %w{play_date category difficulty streak}
      game_info.each_with_index do |info,idx|
        break if idx == key_arr.length
        if info.is_a? String
          update_str = "UPDATE games SET #{key_arr[idx]}=\"#{info}\" WHERE player_id=#{game_info[-1]}\;"
        else
          update_str = "UPDATE games SET #{key_arr[idx]}=#{info} WHERE player_id=#{game_info[-1]};"
        end
        @db.execute(update_str)
      end
    end
  end

  def retrieve_game(user_id)
    @game_info = @db.execute("SELECT * FROM games WHERE player_id=\"#{user_id}\";")
  end
end
