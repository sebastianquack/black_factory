require 'test_helper'

class UsernameCookiesControllerTest < ActionController::TestCase
  setup do
    @username_cookie = username_cookies(:one)
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

  test "should create username_cookie" do
    assert_difference('UsernameCookie.count') do
      post :create, username_cookie: { cookiehash: @username_cookie.cookiehash, username: @username_cookie.username }
    end

    assert_redirected_to username_cookie_path(assigns(:username_cookie))
  end

  test "should show username_cookie" do
    get :show, id: @username_cookie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @username_cookie
    assert_response :success
  end

  test "should update username_cookie" do
    put :update, id: @username_cookie, username_cookie: { cookiehash: @username_cookie.cookiehash, username: @username_cookie.username }
    assert_redirected_to username_cookie_path(assigns(:username_cookie))
  end

  test "should destroy username_cookie" do
    assert_difference('UsernameCookie.count', -1) do
      delete :destroy, id: @username_cookie
    end

    assert_redirected_to username_cookies_path
  end
end
