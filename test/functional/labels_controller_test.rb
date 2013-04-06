require 'test_helper'

class LabelsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get toggle" do
    get :toggle
    assert_response :success
  end

end
