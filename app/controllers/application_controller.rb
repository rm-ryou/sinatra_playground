require 'padrino-helpers'

class ApplicationController < Sinatra::Base
  register Padrino::Helpers

  configure do
    set     :views, 'app/views'
    set     :public_folder, 'public'
    enable  :method_override
    enable  :sessions
  end

  get '/' do
    erb :'hello.html'
  end
end

