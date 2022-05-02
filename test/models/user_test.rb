require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @gg_e = restaurants(:gg_e)
    @gg_t = restaurants(:gg_t)
  end

  test 'returns whether the user has favorited a specific restaurant' do
    assert @user.favorited? @gg_e
    assert !(@user.favorited? @gg_t)
  end
end
