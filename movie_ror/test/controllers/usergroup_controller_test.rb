require 'test_helper'

class UsergroupControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get usergroup_create_url
    assert_response :success
  end

end
