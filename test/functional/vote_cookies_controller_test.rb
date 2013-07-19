require 'test_helper'

class VoteCookiesControllerTest < ActionController::TestCase
  setup do
    @vote_cooky = vote_cookies(:one)
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

  test "should create vote_cooky" do
    assert_difference('VoteCookie.count') do
      post :create, vote_cooky: { design_id: @vote_cooky.design_id, hash: @vote_cooky.hash, ip: @vote_cooky.ip, vote: @vote_cooky.vote }
    end

    assert_redirected_to vote_cooky_path(assigns(:vote_cooky))
  end

  test "should show vote_cooky" do
    get :show, id: @vote_cooky
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_cooky
    assert_response :success
  end

  test "should update vote_cooky" do
    put :update, id: @vote_cooky, vote_cooky: { design_id: @vote_cooky.design_id, hash: @vote_cooky.hash, ip: @vote_cooky.ip, vote: @vote_cooky.vote }
    assert_redirected_to vote_cooky_path(assigns(:vote_cooky))
  end

  test "should destroy vote_cooky" do
    assert_difference('VoteCookie.count', -1) do
      delete :destroy, id: @vote_cooky
    end

    assert_redirected_to vote_cookies_path
  end
end
