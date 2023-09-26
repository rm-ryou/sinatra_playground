require_relative './config/application'
require 'sinatra/activerecord/rake'

desc "start console"
task :console do
  sh %{bin/irb -r ./config/application.rb}
end
task :c => [:console]

desc "start server on port 3000"
task :server do
  sh %{bin/rackup -p 3000}
end
task :s => [:server]

namespace :setup do
  # desc "exec bundle install"
  # task :bundler do
  #   sh <<-EOL, { verbose: false }
  #     bundle install
  #   EOL
  # end

  desc "setup database"
  task :db do
    sh <<-EOL, { verbose: false }
      rake db:drop
      rake db:migrate
    EOL
  end
end

desc "exec setup:db"
# task :all => ["setup:bundler", "setup:db"] do
task :all => ["setup:db"] do
  puts "install gem & setup database."
end

task :default => :server
