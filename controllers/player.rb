get '/player/new' do
  erb(:'player/new')
end

post '/player/new' do
  player = Player.new(params)
  player.save()
  redirect to ('/player/index')
end

get '/player/index' do
  @players = Player.all
  erb(:'player/index')
end