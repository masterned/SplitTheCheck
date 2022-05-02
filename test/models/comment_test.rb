require "test_helper"

class CommentTest < ActiveSupport::TestCase
  setup do
    @one = comments(:one)
    @two = comments(:two)
  end

  test "to_s returns comment summary" do
    assert_equal "on #{Date.today}, Mr. One says: \"I am number one!\"", @one.to_s

    assert_equal "on #{Date.today}, Number 2 says: \"Who do I work for?\"", @two.to_s
  end
end
