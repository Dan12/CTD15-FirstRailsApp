class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #uncomment to fix authentication error
  #skip_before_filter  :verify_authenticity_token
  
  helper_method :lorem
  
  def lorem
    return "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end
  
  def first
    @url = "http://www.iconarchive.com/download/i18083/icons-land/vista-style-emoticons/Cool.ico"
    render 'show'
  end
  def second
    @url = "https://lh3.googleusercontent.com/-jD2j8D9ZfTw/AAAAAAAAAAI/AAAAAAAAAAA/x-CIL-pkuEI/photo.jpg"
    render 'show'
  end
  
  def input
    render "input"
  end
  
  def submit
    #puts params
    #add new user
    data = params["name"]+" "+params["numbers"]
    #override
    #File.open("#{Rails.root}/public/files/temp.txt", 'wb') do |f|
    #append to file
    File.open("#{Rails.root}/public/files/temp.txt", 'a') do |f|
      f.write data+"\n"
    end
  end
  
  def show
    @user = User.find_by_id(params["id"])
    if !(@user == nil)
      @user.description = lorem
      render 'users'
    else
      render 'noUser'
    end
  end
  
  def userForm
    render 'newUser'
  end
  
  def newUser
    #puts params
    u = User.new
    u.name = params['name']
    u.imgUrl = params['imgUrl']
    u.membSince = params['membSince'].to_i
    u.location = params['location']
    u.completion = params['completion'].to_i
    u.description = params['description']
    u.save
    #puts User.all
    #puts u
    redirect_to "/users/#{u.id}"
  end
  
  def editUserPage
    @user = User.find_by_id(params['id'])
    render 'editUser'
  end
  
  def editUser
    u = User.find_by_id(params['id'])
    u.name = params['name']
    u.imgUrl = params['imgUrl']
    u.membSince = params['membSince'].to_i
    u.location = params['location']
    u.completion = params['completion'].to_i
    u.description = params['description']
    u.save
    redirect_to "/users/#{u.id}"
  end
  
  def deleteUser
    u = User.find_by_id(params['id'])
    u.destroy
    redirect_to "/users/#{User.last.id}"
  end
end
