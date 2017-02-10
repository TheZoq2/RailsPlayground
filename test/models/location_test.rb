require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "paths" do
      location1 = Location.create
      location2 = Location.create
      location3 = Location.create

      location1.add_path(location2)

      assert_equal(1, location1.neighbours.count)
      assert_equal(location1.neighbours.first, location2)
      assert_equal(1, location2.neighbours.count)
      assert_equal(location2.neighbours.first, location1)

      #Making sure the has_path works
      assert(location1.has_path_to(location2))
      assert(location2.has_path_to(location1))
      assert_not(location1.has_path_to(location3))


      location1.remove_path(location2);
      assert_not(location1.has_path_to(location2))
      assert_not(location2.has_path_to(location1))
  end

  test "paths_between_multiple" do
      location1 = Location.create
      location2 = Location.create
      location3 = Location.create
      location4 = Location.create

      location1.add_path(location2)
      location1.add_path(location3)
      location3.add_path(location4)

      assert(location1.has_path_to(location2))
      #assert(location1.has_path_to(location3))
      assert(location2.has_path_to(location1))
      assert(location3.has_path_to(location1))
  end

  test "setting paths" do
      location1 = Location.create
      location2 = Location.create
      location3 = Location.create
      location4 = Location.create

      location1.set_paths({location2 => true, location3 => false, location4 => true});

      assert(location1.has_path_to(location2))
      assert_not(location1.has_path_to(location3))
      assert(location1.has_path_to(location4))
  end
end
