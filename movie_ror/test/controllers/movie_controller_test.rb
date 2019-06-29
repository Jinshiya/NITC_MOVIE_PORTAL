require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get movie_new_url
    assert_response :success
  end

  test "should get create" do
    get movie_create_url
    assert_response :success
  end

  test "should get show" do
    get movie_show_url
    assert_response :success
  end

  test "should get book" do
    get movie_book_url
    assert_response :success
  end

end
