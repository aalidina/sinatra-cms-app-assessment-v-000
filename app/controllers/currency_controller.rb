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
    @currency = Currency.all
    @crypto = Currency.create(:name => params[:name], :price => params[:content])
      @crypto = @currency.find_by(params[:currency])
    #Searching for the currency by using the id number from @currency
     redirect to "/currencies/#{@crypto.id}"
     #redirect to show route to show user the selection on show #page
  end

  get '/currencies/:id' do #displays one currency based on ID in the url
    @currency = Currency.all # getting all the currency from seed
    @crypto = @currency.find_by(params[:id])
    #getting the currency by id number
     erb :'/currencies/show'
     #rendering the show page to display user selection
  end

  get '/show' do # show users selection
    @currency = Currency.all
    @crypto = @currency.find_by(params[:id])
    erb :'/currencies/show'
  end

  get '/currencies/:id/edit' do  #load edit form
    @currency = Currency.all
    @crypto = @currency.find_by(params[:id])
    erb :'/currencies/edit'
  end

  delete '/currencies/:id/delete' do #delete action
    @currency = Currency.all
    @crypto = @currency.find(params[:id])
    redirect to '/currencies/new'
  end


end
