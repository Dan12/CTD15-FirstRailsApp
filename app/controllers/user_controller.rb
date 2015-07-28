class UserController < ApplicationController
  def welcome
    @users = User.all
    render "welcome"
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
    redirect_to "/welcome"
  end
end