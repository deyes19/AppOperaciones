require "test_helper"

class RankactivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rankactive = rankactives(:one)
  end

  test "should get index" do
    get rankactives_url
    assert_response :success
  end

  test "should get new" do
    get new_rankactive_url
    assert_response :success
  end

  test "should create rankactive" do
    assert_difference("Rankactive.count") do
      post rankactives_url, params: { rankactive: { name: @rankactive.name } }
    end

    assert_redirected_to rankactive_url(Rankactive.last)
  end

  test "should show rankactive" do
    get rankactive_url(@rankactive)
    assert_response :success
  end

  test "should get edit" do
    get edit_rankactive_url(@rankactive)
    assert_response :success
  end

  test "should update rankactive" do
    patch rankactive_url(@rankactive), params: { rankactive: { name: @rankactive.name } }
    assert_redirected_to rankactive_url(@rankactive)
  end

  test "should destroy rankactive" do
    assert_difference("Rankactive.count", -1) do
      delete rankactive_url(@rankactive)
    end

    assert_redirected_to rankactives_url
  end
end
