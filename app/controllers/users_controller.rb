class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      redirect to '/users/create'
    else
      redirect to '/'
    end
  end

  get '/login' do
    if !logged_in?
      redirect to '/users/login'
    else
      redirect to '/'
    end
  end

  post '/signup' do
    if !(params[:gallery_name] == "" || params[:email] == "" || params[:password] == "")
      @user = User.new(:gallery_name => params[:gallery_name], :email => params[:email], :password => params[:password])
      @user.save
      sessions[:user_id] = @user.id
    end
    redirect to '/'
  end


  post '/login' do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/'
    else
      redirect to '/login'
    end
  end

  get 'logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
