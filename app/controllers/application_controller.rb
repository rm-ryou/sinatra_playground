class ApplicationController < Sinatra::Base
  register Padrino::Helpers
  register Sinatra::Flash
  helpers ::SessionsHelper

  configure do
    set     :views, 'app/views'
    set     :public_folder, 'public'
    enable  :method_override
    enable  :sessions
  end

  before '/*' do
    redirect_to_logged_in if request.path_info.include? "todos"
  end

  get '/' do
    erb :'hello.html'
  end
end

