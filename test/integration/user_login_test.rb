require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { username: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?, "flash should be present initially"
    get root_path
    assert flash.empty?, "flash should disapear after a redirect"
  end

end
