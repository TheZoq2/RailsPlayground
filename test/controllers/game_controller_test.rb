require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "get index" do
    location = Location.create(name: "test")
    character = Character.create(name: "test", location: location)

    @controller.session[:character_id] = character.id
    get "index"
    assert_response :success
  end

  test "travel to new destination" do
    location1 = Location.create(name: "test")
    location2 = Location.create(name: "test")
    location1.add_path(location2)

    character=Character.create(name: "test", location: location1)

    @controller.session[:character_id] = character.id
    get "travel_to", params = {id: location2.id}
    assert_response :redirect
  end
end
