require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
    test "locations" do
        location1 = Location.create
        location2 = Location.create

        character = Character.create(name: "1", location: location1)
    end
end
