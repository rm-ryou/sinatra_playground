class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup.html'
  end

  post '/signup' do
    @user = User.new(name: params[:user][:name], password: params[:user][:password])

    if @user.save
      session[:user_id] = @user.id
      redirect '/todos'
    else
      redirect '/signup'
    end
  end
end
