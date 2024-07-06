require "application_system_test_case"

class ThriftsTest < ApplicationSystemTestCase
  setup do
    @thrift = thrifts(:one)
  end

  test "visiting the index" do
    visit thrifts_url
    assert_selector "h1", text: "Thrifts"
  end

  test "should create thrift" do
    visit thrifts_url
    click_on "New thrift"

    fill_in "Address", with: @thrift.address
    fill_in "City", with: @thrift.city
    fill_in "Hours", with: @thrift.hours
    fill_in "Phone", with: @thrift.phone
    fill_in "State", with: @thrift.state
    fill_in "Store", with: @thrift.store
    click_on "Create Thrift"

    assert_text "Thrift was successfully created"
    click_on "Back"
  end

  test "should update Thrift" do
    visit thrift_url(@thrift)
    click_on "Edit this thrift", match: :first

    fill_in "Address", with: @thrift.address
    fill_in "City", with: @thrift.city
    fill_in "Hours", with: @thrift.hours
    fill_in "Phone", with: @thrift.phone
    fill_in "State", with: @thrift.state
    fill_in "Store", with: @thrift.store
    click_on "Update Thrift"

    assert_text "Thrift was successfully updated"
    click_on "Back"
  end

  test "should destroy Thrift" do
    visit thrift_url(@thrift)
    click_on "Destroy this thrift", match: :first

    assert_text "Thrift was successfully destroyed"
  end
end
