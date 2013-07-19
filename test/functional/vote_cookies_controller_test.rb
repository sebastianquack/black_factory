require 'test_helper'

class VoteCookiesControllerTest < ActionController::TestCase
  setup do
    @vote_cookie = vote_cookies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_cookies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_cookie" do
    assert_difference('VoteCookie.count') do
      post :create, vote_cookie: { cookiehash: @vote_cookie.cookiehash, design_id: @vote_cookie.design_id, ip: @vote_cookie.ip, vote: @vote_cookie.vote }
    end

    assert_redirected_to vote_cookie_path(assigns(:vote_cookie))
  end

  test "should show vote_cookie" do
    get :show, id: @vote_cookie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_cookie
    assert_response :success
  end

  test "should update vote_cookie" do
    put :update, id: @vote_cookie, vote_cookie: { cookiehash: @vote_cookie.cookiehash, design_id: @vote_cookie.design_id, ip: @vote_cookie.ip, vote: @vote_cookie.vote }
    assert_redirected_to vote_cookie_path(assigns(:vote_cookie))
  end

  test "should destroy vote_cookie" do
    assert_difference('VoteCookie.count', -1) do
      delete :destroy, id: @vote_cookie
    end

    assert_redirected_to vote_cookies_path
  end
end
