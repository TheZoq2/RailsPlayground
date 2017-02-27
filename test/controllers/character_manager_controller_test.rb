require 'test_helper'

class CharacterManagerControllerTest < ActionController::TestCase
  test "index test" do
    get "index"
    assert_response :success

  end

  test "create test" do
    get "create", character_controller: { name: "Yolo" }
    assert_response :redirect
  end

  test "deselect test" do
    get "deselect"
    assert_response :redirect
  end
end
