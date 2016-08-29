require_relative "../db/sql_runner"

class Player
  
  attr_reader :id, :name

  def self.all()
    sql = "SELECT * FROM players;"
    return Player.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM players"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM players WHERE id = #{id};"
    return Player.map_item( sql )
  end

  def self.map_items( sql )
    players = SqlRunner.run( sql )
    return players.map { |player| Player.new(player) }
  end

  def self.map_item( sql )
    return self.map_items(sql).first
  end

  def initialize( options )
    @name = options["name"]
    @id = options["id"].to_i
  end

  def save()
    sql = "INSERT INTO players (
      name
      ) VALUES (
      '#{@name}'
      ) RETURNING * ;"
    player = Player.map_item( sql )
    @id = player.id
  end

end