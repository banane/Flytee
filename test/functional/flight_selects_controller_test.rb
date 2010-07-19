require 'test_helper'

class FlightSelectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flight_selects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight_select" do
    assert_difference('FlightSelect.count') do
      post :create, :flight_select => { }
    end

    assert_redirected_to flight_select_path(assigns(:flight_select))
  end

  test "should show flight_select" do
    get :show, :id => flight_selects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => flight_selects(:one).to_param
    assert_response :success
  end

  test "should update flight_select" do
    put :update, :id => flight_selects(:one).to_param, :flight_select => { }
    assert_redirected_to flight_select_path(assigns(:flight_select))
  end

  test "should destroy flight_select" do
    assert_difference('FlightSelect.count', -1) do
      delete :destroy, :id => flight_selects(:one).to_param
    end

    assert_redirected_to flight_selects_path
  end
end
