require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include SignInHelper
  include SignOutHelper
  test "should log in" do
    sign_in_as_test
    assert @controller.logged_in?
  end

  test "should get new from root" do
    get root_path
    assert_response :success
  end

  test "should get new from new path" do
    get sessions_path
    assert_response :success
  end

  test "should logout user" do
    sign_in_as_test
    sign_out
    assert_not @controller.logged_in?
  end
end
