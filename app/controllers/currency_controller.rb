require 'pry'

class CurrencyController < ApplicationController

  get '/currencies' do
    @currency = Currency.all
    erb :'/currencies/index'
  end

  get '/currencies/new' do
    @currency = Currency.all
    erb :'currencies/new'
  end

  post '/currencies' do
    binding.pry
  end


  # get '/list' do
  #   @currency = Currency.all
  #   if logged_in?
  #     erb :'/currencies/index'
  #   else
  #     redirect '/login'
  #   end
  # end
  #
  # post '/list' do
  #   name = params.fetch("name")
  #   redirect '/show'
  # end
  #
  # patch '/list/:id' do
  #
  # end

  # get '/lists/:list_id' do
  #   @currency = Currency.all
  #   @currency.index { |l| l.id == params[:crypto_id].to_i }
  #   erb :show
  # end
  #
  # post '/list' do
  #    Currency.create(:name => params[:list][:name], :price => params[:price][:name] )
  #    redirect '/list'
  # end


end
