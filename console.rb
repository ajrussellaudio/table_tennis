require "pry-byebug"

require_relative "./models/player"

Player.delete_all

player1 = Player.new({
  "name" => "Alan"
  })
player1.save()

binding.pry
nil