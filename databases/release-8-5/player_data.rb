require "sqlite3"

class PlayerData
  def initialize
    @db = SQLite3::Database.new("playerdata.db")
  end

  def exists?
  end

  def get_stats
  end
end
