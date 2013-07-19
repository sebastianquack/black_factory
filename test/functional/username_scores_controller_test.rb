require 'test_helper'

class UsernameScoresControllerTest < ActionController::TestCase
  setup do
    @username_score = username_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:username_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create username_score" do
    assert_difference('UsernameScore.count') do
      post :create, username_score: { score: @username_score.score, username: @username_score.username }
    end

    assert_redirected_to username_score_path(assigns(:username_score))
  end

  test "should show username_score" do
    get :show, id: @username_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @username_score
    assert_response :success
  end

  test "should update username_score" do
    put :update, id: @username_score, username_score: { score: @username_score.score, username: @username_score.username }
    assert_redirected_to username_score_path(assigns(:username_score))
  end

  test "should destroy username_score" do
    assert_difference('UsernameScore.count', -1) do
      delete :destroy, id: @username_score
    end

    assert_redirected_to username_scores_path
  end
end
