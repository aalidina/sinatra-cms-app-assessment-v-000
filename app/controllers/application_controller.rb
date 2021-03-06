require './config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do #built-in settings that control whether features are enabled or #not.
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions # turns sessions on
    register Sinatra::Flash
    set :session_secret, "password_security" #uses bcrypt to encrypt the password so that its not in plan text. 
  end

  get '/' do #home route or default route
    if logged_in?
      @currency = Currency.all
      erb :index
    else
      redirect to '/welcome'
    end
  end

  get '/welcome' do #home route or default route
    @currency = Currency.all
    erb :welcome
  end

  helpers do

    def current_user
       @current_user ||= User.find(session[:id]) if session[:id]
    end

    def logged_in?
      !!current_user
    end

  end
end
