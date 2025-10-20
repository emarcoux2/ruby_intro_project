require "test_helper"

class CardTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get card_types_index_url
    assert_response :success
  end

  test "should get show" do
    get card_types_show_url
    assert_response :success
  end
end
