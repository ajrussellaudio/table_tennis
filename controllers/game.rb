get '/game/new' do
  @players = Player.all
  erb(:'game/new')
end

post'/game/new' do
  game = Game.new(params)
  game.save()
  redirect to "/game/play/#{ game.id }"
end

get '/game/play/:id' do
  @game = Game.find(params['id'])
  erb(:'game/play')
end