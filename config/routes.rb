Rails.application.routes.draw do
  root 'application#welcome'
  get '/pg1' => 'application#pg1'
  get '/test' => 'application#testpage'
  get '/fir' => 'application#first'
  get '/sec' => 'application#second'
  get '/temp/1' => 'temp#pg1'
  get '/temp/2' => 'temp#pg2'
  
  get '/users/:id' => 'application#show'
  
  get '/input' => 'application#input'
  match '/submitForm' => 'application#submit', :via => :post
  
  get '/newUser' => 'application#userForm'
  get '/submitNewUser' => 'application#newUser'
  
  get '/editUser/:id' => 'application#editUserPage'
  get 'submitEditUser/:id' => 'application#ed'
  
  get '/deleteUser/:id' => 'application#deleteUser'
end
