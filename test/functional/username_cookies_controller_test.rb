require 'test_helper'

class UsernameCookiesControllerTest < ActionController::TestCase
  setup do
    @username_cooky = username_cookies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:username_cookies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create username_cooky" do
    assert_difference('UsernameCookie.count') do
      post :create, username_cooky: { hash: @username_cooky.hash, username: @username_cooky.username }
    end

    assert_redirected_to username_cooky_path(assigns(:username_cooky))
  end

  test "should show username_cooky" do
    get :show, id: @username_cooky
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @username_cooky
    assert_response :success
  end

  test "should update username_cooky" do
    put :update, id: @username_cooky, username_cooky: { hash: @username_cooky.hash, username: @username_cooky.username }
    assert_redirected_to username_cooky_path(assigns(:username_cooky))
  end

  test "should destroy username_cooky" do
    assert_difference('UsernameCookie.count', -1) do
      delete :destroy, id: @username_cooky
    end

    assert_redirected_to username_cookies_path
  end
end
