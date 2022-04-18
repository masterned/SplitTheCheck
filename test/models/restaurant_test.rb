require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  fixtures :restaurants

  test 'gets number of "will split" votes associated with the restaurant' do
    assert_equal 1, restaurants(:gg_e).get_will_split_votes
  end

  test 'gets number of "won\'t split" votes associated with the restaurant' do
    assert_equal 2, restaurants(:gg_e).get_will_not_split_votes
  end

  class SearchTest < ActiveSupport::TestCase
    test "returns all restaurants if both name & location are missing or blank" do 
      assert_equal Restaurant.all, Restaurant.search()
      assert_equal Restaurant.all, Restaurant.search(name: nil, location: nil)
      assert_equal Restaurant.all, Restaurant.search(name: nil)
      assert_equal Restaurant.all, Restaurant.search(name: nil)
      assert_equal Restaurant.all, Restaurant.search(name: "", location: "")
      assert_equal Restaurant.all, Restaurant.search(name: nil, location: "")
      assert_equal Restaurant.all, Restaurant.search(name: "", location: nil)
    end

    test "returns restaurants with matching name" do
      assert_equal [restaurants(:gg_e), restaurants(:gg_t)], Restaurant.search(name: "Garden Grill")
      assert_equal [restaurants(:ss_e), restaurants(:s2_e)], Restaurant.search(name: "S")
    end
    
    test "return restaurants with matching location" do
      assert_equal [restaurants(:gg_t)], Restaurant.search(location: "Tifton")
      assert_equal [restaurants(:gg_e), restaurants(:ss_e), restaurants(:s2_e)], Restaurant.search(location: "EPCOT")
    end

    test "returns restaurants with matching name & location" do
      assert_equal [restaurants(:gg_e)], Restaurant.search(name: "Garden", location: "EPCOT")
    end
  end
end
