require 'pry'

class CurrencyController < ApplicationController

  get '/currencies/index' do
    erb :'/currencies/index'
  end

  get '/currencies' do
    erb :'/currencies/index'
  end

  get '/currencies/new' do
    @currency = Currency.all
    erb :'currencies/new'
  end

  post '/currencies' do
    #getting the data from the form and saving it in a istance variable
     #redirect to show route to show user the selection on show #page
  end

  get '/show' do
    @crypto = Currency.find(params["currency_id"])
    erb :'/currencies/show'
  end

  post '/show' do
    @crypto = Currency.find(params["currency_id"])
    erb :'/currencies/show'
  end

  get '/delete' do
  erb :'/currencies/show'
  end

  post '/delete' do
    @crypto = Currency.find(params["currency_id"])
    @delete = params.fetch("currency_id")
    @delete.to_i
    erb :'/currencies/show'
  end

end
