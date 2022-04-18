require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote = votes(:one)
  end

  test "should create vote" do
    skip
    
    assert_difference('Vote.count') do
      post votes_url, params: { vote: { restaurant_id: @vote.restaurant_id, user_id: @vote.user_id, will_split?: @vote.will_split? } }
    end

    assert_redirected_to restaurants_url
  end
end
