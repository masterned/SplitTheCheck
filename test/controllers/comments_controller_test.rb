require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
    @user = users(:one)
    @gg_e = restaurants(:gg_e)
  end

  test "should get new" do
    sign_in @user

    get new_comment_url(restaurant_id: @gg_e)
    assert_response :success
  end

  test "should create comment" do
    sign_in @user

    assert_difference('Comment.count') do
      get new_comment_url(restaurant_id: @gg_e)
      post comments_url, params: { comment: { body: @comment.body } }
    end

    assert_redirected_to restaurant_url(Comment.last.restaurant_id)
  end
end
