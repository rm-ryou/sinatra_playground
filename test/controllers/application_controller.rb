require_relative '../test_helper'

class ApplicationControllerTest < SinatraTestCase
  def app
    ApplicationController
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal "<h1>Hello, World</h1>\n", last_response.body
  end
end

