require 'test_helper'

class FareHistoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fare_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fare_history" do
    assert_difference('FareHistory.count') do
      post :create, :fare_history => { }
    end

    assert_redirected_to fare_history_path(assigns(:fare_history))
  end

  test "should show fare_history" do
    get :show, :id => fare_histories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fare_histories(:one).to_param
    assert_response :success
  end

  test "should update fare_history" do
    put :update, :id => fare_histories(:one).to_param, :fare_history => { }
    assert_redirected_to fare_history_path(assigns(:fare_history))
  end

  test "should destroy fare_history" do
    assert_difference('FareHistory.count', -1) do
      delete :destroy, :id => fare_histories(:one).to_param
    end

    assert_redirected_to fare_histories_path
  end
end
