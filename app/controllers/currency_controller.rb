require 'pry'

class CurrencyController < ApplicationController

  get '/currencies' do #index page to display all currency
    if logged_in?
      @user = User.find_by_id(session[:id])

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
    @user = User.find_by_id(session[:id])
    if !params[:currency].empty?
      @crypto = Currency.create(name: params[:currency][:name], price: params[:currency][:price], user: current_user) # This matches the hash I #created in the new submit form and its #connecting user id with currency
    end
    redirect to "/currencies/#{@crypto.id}"
  end

  get '/currencies/:id' do #displays one currency based on ID in the url
    if logged_in?
      @crypto = Currency.find_by(id: params[:id]) #getting the currency by #current_user id number
      erb :'/currencies/show' #rendering the show page to display user selection
    else
     redirect '/login'
    end
  end

  get '/currencies/:id/edit' do  #load edit form
    @crypto = Currency.find_by(id: params[:id]) # find currency by id
    if logged_in? && @crypto.user_id == current_user.id
      erb :'/currencies/edit'
    else
      redirect '/login'
    end
  end

  patch '/currencies/:id/edit' do #edit action
    if params["currency"].empty?
       redirect to "/currencies/:id/edit"
     else
       @crypto = Currency.find_by(params[:id])
       @crypto.update(name: params[:currency][:name], price: params[:currency][:price])

       redirect to "/currencies/:id"
     end
  end

  post '/currencies/:id/delete' do #delete action
    if logged_in?
      @crypto = Currency.find_by(params[:id])
      @crypto.delete
      redirect to '/currencies/new'
    else
      redirect '/'
    end
  end


end
#cd labs/sinatra-cms-app-assessment-v-000
