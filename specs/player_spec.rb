require "minitest/autorun"
require "minitest/rg"
require_relative "../models/player"

class PlayerTest < MiniTest::Test

  def setup()
    @player = Player.new({
      "name" => "Alan"
      })
  end

  def test_has_name()
    assert_equal("Alan", @player.name)
  end

end