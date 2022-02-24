require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "example_user")
  end

  # test "the truth" do
  #   assert true
  # end

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

  test "username should consist only of letters, numbers, hyphens, underscores, and periods" do
    @user.username = "!@#$%^&*()"
    assert_not @user.valid?
    @user.username = "cam.smith_1"
    assert @user.valid?, @user.errors.full_messages.to_s
  end

  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "usernames should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end


end
