require 'test_helper'

class BuildingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get building_index_url
    assert_response :success
  end

  test "should get show" do
    get building_show_url
    assert_response :success
  end

end
