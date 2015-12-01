require 'test_helper'

class BrandSessionsControllerTest < ActionController::TestCase
  setup do
    @brand_session = brand_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brand_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brand_session" do
    assert_difference('BrandSession.count') do
      post :create, brand_session: {  }
    end

    assert_redirected_to brand_session_path(assigns(:brand_session))
  end

  test "should show brand_session" do
    get :show, id: @brand_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brand_session
    assert_response :success
  end

  test "should update brand_session" do
    patch :update, id: @brand_session, brand_session: {  }
    assert_redirected_to brand_session_path(assigns(:brand_session))
  end

  test "should destroy brand_session" do
    assert_difference('BrandSession.count', -1) do
      delete :destroy, id: @brand_session
    end

    assert_redirected_to brand_sessions_path
  end
end
