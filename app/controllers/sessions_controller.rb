class SessionsController < ApplicationController
  get '/login' do
    erb :'sessions/new.html'
  end

  post '/login' do
    user = User.find_by(name: params[:sessions][:name])
    if user.nil?
      flash[:warn] = "invalid user or missing password"
      redirect '/login'
    else
      session[:user_id] = user.id
      redirect '/todos'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
