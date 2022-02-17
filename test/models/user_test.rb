require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(username: "ExampleUser")
  end

  test "should be valid" do
    assert @user.valid?, @user.errors.full_messages.to_s
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be one word" do
    @user.username = "Example User"
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end


end
