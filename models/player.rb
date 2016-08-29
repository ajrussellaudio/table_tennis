require_relative "./db/sql_runner"

class Player

  def self.all()
  end

  def self.delete_all()
  end

  def self.find()
  end

  attr_reader :id, :name

  def initialize( options )
    @name = options["name"]
    @id = options["id"].to_i
  end

  def save()
    sql = "INSERT INTO players (
      name
      ) VALUES (
      #{@name}
      ) RETURNING * ;"
    player = Player.map_item( sql )
    @id = player['id'].to_i
  end

end