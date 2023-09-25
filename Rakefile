require_relative './config/application'
require 'sinatra/activerecord/rake'

desc "start irb"
task :console do
  sh %{bin/irb -r ./config/application.rb}
end
task :c => [:console]

desc "start server on port 3000"
task :server do
  sh %{bin/rackup -p 3000}
end
task :s => [:server]

