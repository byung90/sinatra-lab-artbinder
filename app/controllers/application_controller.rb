class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fwitter_secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def slug
      username.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
      User.all.find{|user| user.slug == slug}
    end

  end


end
