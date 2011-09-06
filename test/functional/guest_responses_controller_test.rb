require 'test_helper'

class GuestResponsesControllerTest < ActionController::TestCase
  setup do
    @guest_response = guest_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guest_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guest_response" do
    assert_difference('GuestResponse.count') do
      post :create, guest_response: @guest_response.attributes
    end

    assert_redirected_to guest_response_path(assigns(:guest_response))
  end

  test "should show guest_response" do
    get :show, id: @guest_response.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guest_response.to_param
    assert_response :success
  end

  test "should update guest_response" do
    put :update, id: @guest_response.to_param, guest_response: @guest_response.attributes
    assert_redirected_to guest_response_path(assigns(:guest_response))
  end

  test "should destroy guest_response" do
    assert_difference('GuestResponse.count', -1) do
      delete :destroy, id: @guest_response.to_param
    end

    assert_redirected_to guest_responses_path
  end
end
