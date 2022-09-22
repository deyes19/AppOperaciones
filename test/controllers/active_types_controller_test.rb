require "test_helper"

class ActiveTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @active_type = active_types(:one)
  end

  test "should get index" do
    get active_types_url
    assert_response :success
  end

  test "should get new" do
    get new_active_type_url
    assert_response :success
  end

  test "should create active_type" do
    assert_difference("ActiveType.count") do
      post active_types_url, params: { active_type: { description: @active_type.description } }
    end

    assert_redirected_to active_type_url(ActiveType.last)
  end

  test "should show active_type" do
    get active_type_url(@active_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_active_type_url(@active_type)
    assert_response :success
  end

  test "should update active_type" do
    patch active_type_url(@active_type), params: { active_type: { description: @active_type.description } }
    assert_redirected_to active_type_url(@active_type)
  end

  test "should destroy active_type" do
    assert_difference("ActiveType.count", -1) do
      delete active_type_url(@active_type)
    end

    assert_redirected_to active_types_url
  end
end
