require 'test_helper'

class CombatHelperTest < ActionController::TestCase
  test "combat helper test" do
    list = CombatHelper::CardList.new

    assert_not_nil list.get_card_by_id(0)
    assert_not_nil list.get_random_card
  end
end
