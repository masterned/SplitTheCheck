require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @restaurant = restaurants(:gg_e)
    @user = users(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user

    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    sign_in @user

    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: @restaurant.location, name: @restaurant.name } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user

    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    sign_in @user

    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name } }
    
    assert_redirected_to restaurant_url(@restaurant)
  end

  test 'should search restaurants' do
    get search_url, params: {name: "Garden", location: "EPCOT"}
    assert_response :success
  end
end
