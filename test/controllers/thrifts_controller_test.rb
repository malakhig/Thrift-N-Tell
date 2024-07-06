require "test_helper"

class ThriftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thrift = thrifts(:one)
  end

  test "should get index" do
    get thrifts_url
    assert_response :success
  end

  test "should get new" do
    get new_thrift_url
    assert_response :success
  end

  test "should create thrift" do
    assert_difference("Thrift.count") do
      post thrifts_url, params: { thrift: { address: @thrift.address, city: @thrift.city, hours: @thrift.hours, phone: @thrift.phone, state: @thrift.state, store: @thrift.store } }
    end

    assert_redirected_to thrift_url(Thrift.last)
  end

  test "should show thrift" do
    get thrift_url(@thrift)
    assert_response :success
  end

  test "should get edit" do
    get edit_thrift_url(@thrift)
    assert_response :success
  end

  test "should update thrift" do
    patch thrift_url(@thrift), params: { thrift: { address: @thrift.address, city: @thrift.city, hours: @thrift.hours, phone: @thrift.phone, state: @thrift.state, store: @thrift.store } }
    assert_redirected_to thrift_url(@thrift)
  end

  test "should destroy thrift" do
    assert_difference("Thrift.count", -1) do
      delete thrift_url(@thrift)
    end

    assert_redirected_to thrifts_url
  end
end
