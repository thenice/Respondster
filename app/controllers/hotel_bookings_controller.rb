class HotelBookingsController < ApplicationController
  # GET /hotel_bookings
  # GET /hotel_bookings.json
  def index
    @hotel_bookings = HotelBooking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotel_bookings }
    end
  end

  # GET /hotel_bookings/1
  # GET /hotel_bookings/1.json
  def show
    @hotel_booking = HotelBooking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hotel_booking }
    end
  end

  # GET /hotel_bookings/new
  # GET /hotel_bookings/new.json
  def new
    @hotel_booking = HotelBooking.new
  end

  # GET /hotel_bookings/1/edit
  def edit
    @hotel_booking = HotelBooking.find(params[:id])
  end

  # POST /hotel_bookings
  # POST /hotel_bookings.json
  def create
    @hotel_booking = HotelBooking.new(params[:hotel_booking])
    if @hotel_booking.save
      @guest = Guest.find(session[:guest_id])
      @guest.hotel_bookings << @hotel_booking
    else
    end
  end

  # PUT /hotel_bookings/1
  # PUT /hotel_bookings/1.json
  def update
    @hotel_booking = HotelBooking.find(params[:id])
    @hotel_booking.update_attributes(params[:hotel_booking])
  end

  # DELETE /hotel_bookings/1
  # DELETE /hotel_bookings/1.json
  def destroy
    @hotel_booking = HotelBooking.find(params[:id])
    @hotel_booking.destroy
  end
end
