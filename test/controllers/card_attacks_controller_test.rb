require "test_helper"

class CardAttacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get card_attacks_index_url
    assert_response :success
  end

  test "should get show" do
    get card_attacks_show_url
    assert_response :success
  end
end
