class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
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
  
  def show
    @user = User.find_by_id(params["id"])
    @user.description = lorem
    render 'users'
  end
end
