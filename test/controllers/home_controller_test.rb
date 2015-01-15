require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get add_new" do
    get :add_new
    assert_response :success
  end

  test "should get create_new" do
    get :create_new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
