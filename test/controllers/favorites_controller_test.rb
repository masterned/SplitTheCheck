require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @favorite = favorites(:one)
    @user = users(:one)
    @gg_t = restaurants(:gg_t)
  end

  test "should create favorite" do
    assert_no_difference('Favorite.count') do
      post favorites_url, params: { user_id: @user.id, restaurant_id: @gg_t.id }
    end
    assert_redirected_to new_user_session_url
    
    sign_in @user

    # Should not create duplicate favorite entries
    assert_no_difference('Favorite.count') do
      post favorites_url, params: { user_id: @favorite.user_id, restaurant_id: @favorite.restaurant_id }
    end

    assert_difference('Favorite.count') do
      post favorites_url, params: { user_id: @user.id, restaurant_id: @gg_t.id }
    end
    assert_redirected_to restaurants_url
  end
  
  test "should destroy favorite" do
    delete favorites_url, params: { user_id: @favorite.user_id, restaurant_id: @favorite.restaurant_id }
    assert_redirected_to new_user_session_url
    
    sign_in @user

    assert_difference('Favorite.count', -1) do
      delete favorites_url, params: { user_id: @favorite.user_id, restaurant_id: @favorite.restaurant_id }
    end

    assert_redirected_to restaurants_url
  end
end
