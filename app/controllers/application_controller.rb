require 'pry'
require './config/environment'
class ApplicationController < Sinatra::Base

  configure do #built-in settings that control whether features are enabled or #not.
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions # turns sessions on
    set :session_secret, "password_security" #is an encryption key that will be #used to create a session_id
  end

  get '/' do #home route or default route
    @currency = Currency.all
    erb :index
  end

  helpers do
    def current_user
      # if !logged_in?
      #   redirect "/login?error=You have to be logged in to do that"
      # end
      #'cache' the user instance into an instance variable
      @current_user ||= User.find(session[:id]) if session[:id]
    end

    def logged_in?
      !!current_user
    end

  end
end
