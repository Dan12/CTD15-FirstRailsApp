Rails.application.routes.draw do
  root 'application#welcome'
  get '/pg1' => 'application#pg1'
  get '/test' => 'application#testpage'
  get '/fir' => 'application#first'
  get '/sec' => 'application#second'
  get '/temp/1' => 'temp#pg1'
  get '/temp/2' => 'temp#pg2'
  
  get '/users/:id' => 'application#show'
end
