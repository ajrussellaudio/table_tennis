require_relative "../db/sql_runner"

class Game

  attr_accessor :player1_id, :player2_id, :player1_score, :player2_score
  attr_reader   :id

  def self.all()
    sql = "SELECT * FROM games;"
    return Game.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM games"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM games WHERE id = #{id};"
    return Game.map_item( sql )
  end

  def self.map_items( sql )
    games = SqlRunner.run( sql )
    return games.map { |game| Game.new(game) }
  end

  def self.map_item( sql )
    return self.map_items(sql).first
  end

  def initialize( options )
    @id            = options['id'].to_i
    @player1_id    = options['player1_id']
    @player2_id    = options['player2_id']
    @player1_score = options['player1_score']
    @player2_score = options['player2_score']
  end

  def save()
    sql = "INSERT INTO games (
      player1_id,
      player2_id,
      player1_score,
      player2_score
      ) VALUES (
      #{@player1_id},
      #{@player2_id},
      #{@player1_score},
      #{@player2_score}
      ) RETURNING * ;"
    game = Game.map_item( sql )
    @id = game.id
  end

end