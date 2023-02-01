require "test_helper"

class RelocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relocation = relocations(:one)
  end

  test "should get index" do
    get relocations_url
    assert_response :success
  end

  test "should get new" do
    get new_relocation_url
    assert_response :success
  end

  test "should create relocation" do
    assert_difference("Relocation.count") do
      post relocations_url, params: { relocation: { _: @relocation._, date_accept: @relocation.date_accept, date_solicited: @relocation.date_solicited } }
    end

    assert_redirected_to relocation_url(Relocation.last)
  end

  test "should show relocation" do
    get relocation_url(@relocation)
    assert_response :success
  end

  test "should get edit" do
    get edit_relocation_url(@relocation)
    assert_response :success
  end

  test "should update relocation" do
    patch relocation_url(@relocation), params: { relocation: { _: @relocation._, date_accept: @relocation.date_accept, date_solicited: @relocation.date_solicited } }
    assert_redirected_to relocation_url(@relocation)
  end

  test "should destroy relocation" do
    assert_difference("Relocation.count", -1) do
      delete relocation_url(@relocation)
    end

    assert_redirected_to relocations_url
  end
end
