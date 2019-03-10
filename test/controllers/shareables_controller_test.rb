require 'test_helper'

class ShareablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shareables_new_url
    assert_response :success
  end

  test "should get create" do
    get shareables_create_url
    assert_response :success
  end

end
