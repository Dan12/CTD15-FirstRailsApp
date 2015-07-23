class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #uncomment to fiz authentication error
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
    puts params
    #add new user
    puts "============="
    puts params["name"]
    puts params["numbers"]
    data = params["name"]+" "+params["numbers"]
    #override
    #File.open("#{Rails.root}/public/files/temp.txt", 'wb') do |f|
    #append to file
    File.open("#{Rails.root}/public/files/temp.txt", 'a') do |f|
      f.write data+"\n"
    end
    puts "recieved"
    puts "==================="
    render "input"
  end
  
  def show
    @user = User.find_by_id(params["id"])
    if !@user == nil
      @user.description = lorem
    else
      @user = User.last
    end
    render 'users'
  end
end
