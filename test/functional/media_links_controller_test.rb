require 'test_helper'

class MediaLinksControllerTest < ActionController::TestCase
  setup do
    @media_link = media_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_link" do
    assert_difference('MediaLink.count') do
      post :create, media_link: { challenge_id: @media_link.challenge_id, design_id: @media_link.design_id, ip: @media_link.ip, url: @media_link.url }
    end

    assert_redirected_to media_link_path(assigns(:media_link))
  end

  test "should show media_link" do
    get :show, id: @media_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @media_link
    assert_response :success
  end

  test "should update media_link" do
    put :update, id: @media_link, media_link: { challenge_id: @media_link.challenge_id, design_id: @media_link.design_id, ip: @media_link.ip, url: @media_link.url }
    assert_redirected_to media_link_path(assigns(:media_link))
  end

  test "should destroy media_link" do
    assert_difference('MediaLink.count', -1) do
      delete :destroy, id: @media_link
    end

    assert_redirected_to media_links_path
  end
end
