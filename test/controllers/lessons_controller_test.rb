require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  test "should get init" do
    get :init
    assert_response :success
  end

end
