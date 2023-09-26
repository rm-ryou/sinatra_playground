class TodosController < ApplicationController
  # helpers SessionsHelper

  # GET /todos
  get '/todos' do
    # redirect_to_logged_in
    # current_user
    @todos = Todo.where(user_id: @current_user)
    # @todos = Todo.all
    erb :'todos/index.html'
  end

  # GET /todos/new
  get '/todos/new' do
    @todo = Todo.new
    erb :'todos/new.html'
  end

  # FIXME: nameだけでcontentがなければ必要ない→contentをテーブルに追加
  # GET /todos/1
  get '/todos/:id' do |id|
    @todo = Todo.find(id)
    # @todo = Todo.find(params[:id])
    erb :'todos/show.html'
  end

  # GET /todos/1/edit
  get '/todos/:id/edit' do |id|
    @todo = Todo.find(id)
    erb :'todos/edit.html'
  end

  patch '/todos/:id' do |id|
    @todo = Todo.find(id)
    @todo.name = params[:todos][:name]
    if @todo.save
      redirect '/todos'
    else
      reidrect "/todos/#{id}/edit"
    end
  end

  # POST /todos
  post '/todos' do
    # redirect_to_logged_in
    @todo = Todo.new(name: params[:todos][:name], user_id: @user.id)
    if @todo.save
      redirect '/todos'
    else
      redirect '/todos/new'
    end
  end

  # DELETE /todos/:id
  delete '/todos/:id' do |id|
    todo = Todo.find(id)
    todo.destroy

    redirect '/todos'
  end
end
