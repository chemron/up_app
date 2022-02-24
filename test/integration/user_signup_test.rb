require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post user_path, params: { user: { username: "",
                        password:              "foo",
                        password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end
end
