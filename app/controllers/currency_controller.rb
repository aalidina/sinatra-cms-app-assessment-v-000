require 'pry'

class CurrencyController < ApplicationController

  get '/currencies' do
    @owners = Owner.all
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
    erb :'/currencies/show'
  end

  post '/show' do
    @crypto = Currency.find(params["currency"]["currency_ids"])
    erb :'/currencies/show'
  end

end
