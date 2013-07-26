require 'test_helper'

class RewardCodesControllerTest < ActionController::TestCase
  setup do
    @reward_code = reward_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_code" do
    assert_difference('RewardCode.count') do
      post :create, reward_code: { achievement_id: @reward_code.achievement_id, code: @reward_code.code, points: @reward_code.points, type: @reward_code.type }
    end

    assert_redirected_to reward_code_path(assigns(:reward_code))
  end

  test "should show reward_code" do
    get :show, id: @reward_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_code
    assert_response :success
  end

  test "should update reward_code" do
    put :update, id: @reward_code, reward_code: { achievement_id: @reward_code.achievement_id, code: @reward_code.code, points: @reward_code.points, type: @reward_code.type }
    assert_redirected_to reward_code_path(assigns(:reward_code))
  end

  test "should destroy reward_code" do
    assert_difference('RewardCode.count', -1) do
      delete :destroy, id: @reward_code
    end

    assert_redirected_to reward_codes_path
  end
end
