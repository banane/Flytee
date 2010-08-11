require 'test_helper'

class FlightsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post :create, :flight => { }
    end

    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should show flight" do
    get :show, :id => flights(:one).to_param
    assert_response :success
  end


end
