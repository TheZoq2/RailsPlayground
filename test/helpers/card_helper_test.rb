require 'test_helper'

class CombatHelperTest < ActionController::TestCase
  test "combat helper test" do
    list = CombatHelper::CardList.new

    list.get_random_card
  end
end
