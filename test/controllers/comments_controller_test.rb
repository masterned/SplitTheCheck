require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
    @user = users(:one)
    @restaurant = restaurants(:gg_e)
  end

  test "should get new" do
    sign_in @user

    get new_comment_url(restaurant_id: restaurants(:gg_e))
    assert_response :success
  end

  test "should create comment" do
    sign_in @user

    assert_difference('Comment.count') do
      post comments_url, params: { comment: { body: @comment.body, restaurant_id: @comment.restaurant_id, user_id: @comment.user_id } }
    end

    assert_redirected_to restaurant_url(Comment.last.restaurant_id)
  end
end
