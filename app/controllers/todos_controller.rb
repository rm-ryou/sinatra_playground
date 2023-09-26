class TodosController < ApplicationController
  # GET /todos
  get '/todos' do
    @todos = Todo.where(user_id: @current_user)
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
    save_redirect_to("/todos/#{id}/edit")
  end

  # POST /todos
  post '/todos' do
    @todo = Todo.new(name: params[:todos][:name], user_id: @user.id)
    save_redirect_to("/todos/new")
  end

  # DELETE /todos/:id
  delete '/todos/:id' do |id|
    todo = Todo.find(id)
    todo.destroy

    redirect '/todos'
  end

  private

  def save_redirect_to(path)
    if @todo.save
      redirect '/todos'
    else
      redirect path
    end
  end
end
