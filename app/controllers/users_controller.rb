class UsersController < ApplicationController

  get '/users/:slug' do
    if current_user == User.find_by_slug(params[:slug])
      @user = current_user
      erb :'users/show'
    else
      flash[:message] = "**You can only access your own My Events page**"
      redirect to "/events"
    end
  end

  get '/signup' do
    if logged_in?
      redirect to "/events"

    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to "/events"
    else 
      flash[:message] = @user.errors.full_messages.join(", ")
      redirect to "/signup"
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/events"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/events"
    else
      redirect to "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "You have been successfully logged out."
      redirect to "/login"
    else
      redirect to "/"
    end
  end

end



