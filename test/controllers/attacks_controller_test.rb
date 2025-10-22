require "test_helper"

class AttacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attacks_index_url
    assert_response :success
  end

  test "should get show" do
    get attacks_show_url
    assert_response :success
  end
end
