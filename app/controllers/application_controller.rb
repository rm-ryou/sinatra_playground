require 'padrino-helpers'

class ApplicationController < Sinatra::Base
  register Padrino::Helpers

  configure do
    set     :views, 'app/views'
    enable  :method_override
  end

  get '/' do
    erb :'hello.html'
  end
end

