require 'pry'

class CurrencyController < ApplicationController

  get '/currencies' do #index page to display all currency
    if logged_in?
      @user = User.find_by_id(session[:user_id])
      erb :'/currencies/index'
    else
    redirect to '/login'
    end
  end

  get '/currencies/new' do #displays create currency form
    if logged_in?
      erb :'/currencies/new'
    else
      redirect '/login'
    end
  end

  post '/currencies' do #creates new currencies
    #  @currency = Currency.create(name: params[:name], price: params[:price], id: params[:id], user_id: current_user.id)
    @user = User.find_by_id(session[:user_id])
    if !params["currency"]["name"].empty? || params["currency"]["price"].empty?
      @crypto = Currency.create(name: params[:name], price: params[:price], user_id: current_user.id)
      @crypto.save
    end
    redirect to "/currencies/:id"
  end

  get '/currencies/:id' do #displays one currency based on ID in the url
    if logged_in?
      @crypto = Currency.all.find_by("id") #getting the currency by id number
      erb :'/currencies/show' #rendering the show page to display user selection
    else
     redirect '/login'
    end
  end

  get '/currencies/:id/edit' do  #load edit form
    @crypto = Currency.find_by("id")
    if logged_in?
      erb :'/currencies/edit'
    else
      redirect '/login'
    end
  end

  patch '/currencies/:id/edit' do #edit action
    if params["currency"].empty?
       redirect to "/currencies/#{params[:id]}/edit"
     else
       @crypto = Currency.all.find_by(params[:id])
       binding.pry
       @crypto.update(currency: params[:currency])

       redirect to "/currencies/#{@crypto.id}"
     end
  end

  post '/currencies/:id/delete' do #delete action
    # crypto = current_user.tweets.find_by(id: params[:id])
    if logged_in?
      @crypto = Currency.all.find_by("id")
      @crypto.delete
      redirect to '/currencies/new'
    else
      redirect '/'
    end
  end


end
#cd labs/sinatra-cms-app-assessment-v-000
