Rails.application.routes.draw do
  root 'user#welcome'
  
  get "/welcome" => 'user#welcome'
  #get '/pg1' => 'application#pg1'
  get '/test' => 'application#testpage'
  get '/fir' => 'application#first'
  get '/sec' => 'application#second'
  get '/temp/1' => 'temp#pg1'
  
  get '/users/:id' => 'user#show'
  
  get '/input' => 'application#input'
  match '/submitForm' => 'application#submit', :via => :post
  
  get '/newUser' => 'user#userForm'
  get '/submitNewUser' => 'user#newUser'
  
  get '/editUser/:id' => 'user#editUserPage'
  get 'submitEditUser/:id' => 'user#editUser'
  
  get '/deleteUser/:id' => 'user#deleteUser'
end
