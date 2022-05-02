require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @favorite = favorites(:one)
    @user = users(:one)
  end

  test "should create favorite" do
    sign_in @user

    assert_difference('Favorite.count') do
      post favorites_url, params: { favorite: { restaurant_id: @favorite.restaurant_id, user_id: @favorite.user_id } }
    end

    assert_redirected_to restaurants_url
  end

  test "should destroy favorite" do
    sign_in @user

    assert_difference('Favorite.count', -1) do
      delete favorites_url, params: { user_id: @favorite.user_id, restaurant_id: @favorite.restaurant_id }
    end

    assert_redirected_to restaurants_url
  end
end
