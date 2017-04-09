require "sqlite3"

class PlayerData
  def initialize
    @db = SQLite3::Database.new("playerdata.db")
    @db.results_as_hash = true
  end

  def exists?(username)
    
  end

  def get_stats
  end
end
