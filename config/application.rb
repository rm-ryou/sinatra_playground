require 'bundler/setup'
Bundler.require
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir("app/helpers")
loader.push_dir("app/controllers")
loader.push_dir("app/models")
loader.setup
loader.eager_load
