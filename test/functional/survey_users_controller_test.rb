require 'test_helper'

class SurveyUsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_user" do
    assert_difference('SurveyUser.count') do
      post :create, :survey_user => { }
    end

    assert_redirected_to survey_user_path(assigns(:survey_user))
  end

  test "should show survey_user" do
    get :show, :id => survey_users(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => survey_users(:one).to_param
    assert_response :success
  end

  test "should update survey_user" do
    put :update, :id => survey_users(:one).to_param, :survey_user => { }
    assert_redirected_to survey_user_path(assigns(:survey_user))
  end

  test "should destroy survey_user" do
    assert_difference('SurveyUser.count', -1) do
      delete :destroy, :id => survey_users(:one).to_param
    end

    assert_redirected_to survey_users_path
  end
end
