require 'test_helper'

class BookmovieControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookmovie_new_url
    assert_response :success
  end

  test "should get create" do
    get bookmovie_create_url
    assert_response :success
  end

end
