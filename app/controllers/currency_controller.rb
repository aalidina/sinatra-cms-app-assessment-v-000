require 'pry'

class CurrencyController < ApplicationController

  get '/currencies/index' do
    @currency = Currency.all
    if logged_in?
      erb :'/currencies/index'
    else
      redirect '/login'
    end
  end

  post '/currencies/index' do
    @currency.create(:name => params[:list][:name])
  end


  get '/lists/:list_id' do
    @currency = Currency.all
  end
  post '/list' do
     params[:item].inspect
     redirect '/'
  end


end
