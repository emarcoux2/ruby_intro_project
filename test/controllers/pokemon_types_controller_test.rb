require "test_helper"

class PokemonTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemon_types_index_url
    assert_response :success
  end

  test "should get show" do
    get pokemon_types_show_url
    assert_response :success
  end
end
