require "sinatra"
require "sinatra/contrib/all"

require "pry-byebug"

require_relative "./models/game"
require_relative "./models/player"
require_relative "./controllers/game"
require_relative "./controllers/player"

get '/' do
  erb(:home)
end