require_relative '../test_helper'

class TodosControllerTest < SinatraTestCase
  def app
    TodosController
  end

  def test_should_get_index
    get '/todos'
    assert last_response.ok?
  end

  def test_should_get_new
    get '/todos/new'
    assert last_response.ok?
  end
end
