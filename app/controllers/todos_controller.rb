class TodosController < ApplicationController
  # GET /todos
  get '/todos' do
    @todos = Todo.all
    erb :'todos/index.html'
  end

  # GET /todos/new
  get '/todos/new' do
    @todo = Todo.new
    erb :'todos/new.html'
  end

  # GET /todos/1
  get '/todos/:id' do
  end

  # GET /todos/1/edit
  get '/todos/:id/edit' do
  end

  # POST /todos
  post '/todos' do
    puts params[:todos][:name]
    @todo = Todo.new(name: params[:todos][:name])
    if @todo.save
      redirect '/todos'
    else
      redirect '/#'
    end
  end

  # PUT /todos/1
  put '/todos/:id' do
  end

  # DELETE /todos/:id
  delete '/todos/:id' do
  end
end
