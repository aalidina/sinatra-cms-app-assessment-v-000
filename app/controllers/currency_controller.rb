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
    @crypto = Currency.create(name: params[:name], price: params[:price], id: params[:id])
    if !params["currency"]["name"].empty?
      @crypto = Currency.create(params["currency"])
      binding.pry
    end
    redirect '/currencies/#{@crypto.id}'
  end

  get '/currencies/' do #displays one currency based on ID in the url
    if logged_in?
      @crypto = Currency.find_by(params[:id]) #getting the currency by id number
      erb :'/currencies/show' #rendering the show page to display user selection
    else
     redirect '/login'
    end
  end

  get '/currencies/:id/edit' do  #load edit form
    @crypto = Currency.all.find_by("id")
    erb :'/currencies/edit'
  end

  # patch '/currencies/:id/edit' do #edit action
  #   binding.pry
  #   @currency = Currency.all
  #   @crypto = @currency.find_by(params[:id])
  #   redirect to "/currencies/#{@crypto.id}"
  # end

  delete '/currencies/:id/delete' do #delete action
    if logged_in?
      @crypto = Currency.all.find_by("id")
      @crypto.delete
      redirect to '/currencies/new'
    else
      redirect '/'
    end
  end


end
