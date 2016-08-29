require "pry-byebug"

require_relative "./models/player"
require_relative "./models/game"

Player.delete_all

player1 = Player.new({
  "name" => "Alan"
  })
player1.save()

player2 = Player.new({
  "name" => "Marj"
  })
player2.save()

game = Game.new({
  "player1_id" => player1.id,
  "player2_id" => player2.id
  })
game.save()

binding.pry
nil