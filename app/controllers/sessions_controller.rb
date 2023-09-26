class SessionsController < ApplicationController
  get '/login' do
    erb :'sessions/new.html'
  end

  post '/login' do
    user = User.find_by(name: params[:sessions][:name])
    redirect '/login' if user.nil?
    session[:user_id] = user.id
    redirect '/todos'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
