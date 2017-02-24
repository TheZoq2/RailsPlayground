require 'test_helper'

class CombatControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "card requests" do
    location1 = Location.create(name: "test")
    location2 = Location.create(name: "test")
    location1.add_path(location2)

    character=Character.create(name: "test", location: location1)

    @controller.session[:character_id] = character.id
    get :new_card
  end
end
