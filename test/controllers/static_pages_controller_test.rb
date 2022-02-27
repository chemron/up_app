require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "(Unofficial) Up Account Viewer"
  end

  
  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end


  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

end
