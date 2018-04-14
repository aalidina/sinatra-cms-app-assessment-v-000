require 'pry'

class CurrencyController < ApplicationController

  # get '/currencies/index' do
  #   erb :'/currencies/index'
  # end

  get '/currencies' do #index page to display all currency
    @currency = Currency.all
    erb :'/currencies/index'
  end

  get '/currencies/new' do #displays create currency form
    @currency = Currency.all
    erb :'currencies/new'
  end

  post '/currencies' do #creates new currencies
    @cryptos = params[:currency].collect do |t|
      Currency.find_by(id: t)
    end

    # @crypto = Currency.create(:name => params[:name], :price => params[:content])
      # @crypto = Currency.find_by(params[:currency])
      # @crypto.save
    #Searching for the currency by using the id number from @currency
    #  redirect to "/currencies"
     #redirect to show route to show user the selection on show #page
    erb :'/currencies/list'
  end

  get '/currencies/:id' do #displays one currency based on ID in the url
    if logged_in?
      @crypto = Currency.find_by(params[:id]) #getting the currency by id number
      erb :'/currencies/show' #rendering the show page to display user selection
    else
     rediect '/'
    end
  end


  # get '/currencies/:id/edit' do  #load edit form
  #   @currency = Currency.all
  #   @crypto = @currency.find_by(params[:id])
  #   erb :'/currencies/edit'
  # end

  # patch '/currencies/:id/edit' do #edit action
  #   binding.pry
  #   @currency = Currency.all
  #   @crypto = @currency.find_by(params[:id])
  #   redirect to "/currencies/#{@crypto.id}"
  # end

  delete '/currencies/:id/delete' do #delete action
    if logged_in?
      @currency = Currency.all
      @crypto = @currency.find(params[:id])
      @crypto.delete
      redirect to '/currencies/new'
    else
      redirect '/'
    end
  end


end
