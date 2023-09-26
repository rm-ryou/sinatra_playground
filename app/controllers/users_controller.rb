class UsersController < ApplicationController
  get '/signup' do
    flash[:blah] if flash[:blah]
    erb :'/users/new.html'
  end

  post '/signup' do
    @user = User.new(name: params[:user][:name], password: params[:user][:password])
    flash[:warn] = @user.errors.full_messages unless @user.valid?

    # if @user.save
    if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      session[:user_id] = @user.id
      redirect '/todos'
    else
      flash[:warn] = "password is invalid."
      redirect '/signup'
    end
  end

end
