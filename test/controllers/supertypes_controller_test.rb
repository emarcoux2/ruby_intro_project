require "test_helper"

class SupertypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supertypes_index_url
    assert_response :success
  end

  test "should get show" do
    get supertypes_show_url
    assert_response :success
  end
end
