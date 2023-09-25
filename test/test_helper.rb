ENV['APP_ENV'] = 'test'
require_relative '../config/application'
# require 'test/unit'
require 'rack/test'

class SinatraTestCase < Test::Unit::TestCase
  include Rack::Test::Methods
end
