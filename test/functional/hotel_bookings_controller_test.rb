require 'test_helper'

class HotelBookingsControllerTest < ActionController::TestCase
  setup do
    @hotel_booking = hotel_bookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_booking" do
    assert_difference('HotelBooking.count') do
      post :create, hotel_booking: @hotel_booking.attributes
    end

    assert_redirected_to hotel_booking_path(assigns(:hotel_booking))
  end

  test "should show hotel_booking" do
    get :show, id: @hotel_booking.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_booking.to_param
    assert_response :success
  end

  test "should update hotel_booking" do
    put :update, id: @hotel_booking.to_param, hotel_booking: @hotel_booking.attributes
    assert_redirected_to hotel_booking_path(assigns(:hotel_booking))
  end

  test "should destroy hotel_booking" do
    assert_difference('HotelBooking.count', -1) do
      delete :destroy, id: @hotel_booking.to_param
    end

    assert_redirected_to hotel_bookings_path
  end
end
