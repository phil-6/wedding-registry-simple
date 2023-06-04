require "test_helper"

class GiftersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gifter = gifters(:one)
  end

  test "should get index" do
    get gifters_url
    assert_response :success
  end

  test "should get new" do
    get new_gifter_url
    assert_response :success
  end

  test "should create gifter" do
    assert_difference("Gifter.count") do
      post gifters_url, params: { gifter: { ammount: @gifter.ammount, email: @gifter.email, gift_id: @gifter.gift_id, message: @gifter.message, name: @gifter.name } }
    end

    assert_redirected_to gifter_url(Gifter.last)
  end

  test "should show gifter" do
    get gifter_url(@gifter)
    assert_response :success
  end

  test "should get edit" do
    get edit_gifter_url(@gifter)
    assert_response :success
  end

  test "should update gifter" do
    patch gifter_url(@gifter), params: { gifter: { ammount: @gifter.ammount, email: @gifter.email, gift_id: @gifter.gift_id, message: @gifter.message, name: @gifter.name } }
    assert_redirected_to gifter_url(@gifter)
  end

  test "should destroy gifter" do
    assert_difference("Gifter.count", -1) do
      delete gifter_url(@gifter)
    end

    assert_redirected_to gifters_url
  end
end
