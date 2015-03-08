class SessionController < ApplicationController


  #credits to PROFSWD lesson on Authentication
  def start
  	if session[:user_id]
  	  redirect_to '/index'
  	end
  end

  def login
  	user = User.authenticate(params[:username], params[:password])
  	if user
  	  session[:user_id] = user.id
      session[:name] = user.name
      session[:song] = 0
  	  redirect_to action: :start
    else
      redirect_to root_path
  	end
  end

  def logout
	session[:user_id] = nil
	redirect_to action: :login_page
  end

  def register_user
    if params[:pass] == params[:cPass] && User.checkDB(params[:username])
      user = User.createUser(params[:username], params[:name], params[:pass])
      redirect_to root_path
    end
  end

  def require_login
    redirect_to root_path if session[:user_id].nil?
  end

  def logout
    session[:user_id] = nil
    session[:name] = nil
    session[:playlist_id] = nil
    session[:playlist_name] = nil
    session[:first] = nil
    redirect_to root_path
  end
end
