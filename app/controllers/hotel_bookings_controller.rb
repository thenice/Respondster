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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotel_booking }
    end
  end

  # GET /hotel_bookings/1/edit
  def edit
    @hotel_booking = HotelBooking.find(params[:id])
  end

  # POST /hotel_bookings
  # POST /hotel_bookings.json
  def create
    @hotel_booking = HotelBooking.new(params[:hotel_booking])

    respond_to do |format|
      if @hotel_booking.save
        format.html { redirect_to @hotel_booking, notice: 'Hotel booking was successfully created.' }
        format.json { render json: @hotel_booking, status: :created, location: @hotel_booking }
      else
        format.html { render action: "new" }
        format.json { render json: @hotel_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hotel_bookings/1
  # PUT /hotel_bookings/1.json
  def update
    @hotel_booking = HotelBooking.find(params[:id])

    respond_to do |format|
      if @hotel_booking.update_attributes(params[:hotel_booking])
        format.html { redirect_to @hotel_booking, notice: 'Hotel booking was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hotel_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_bookings/1
  # DELETE /hotel_bookings/1.json
  def destroy
    @hotel_booking = HotelBooking.find(params[:id])
    @hotel_booking.destroy

    respond_to do |format|
      format.html { redirect_to hotel_bookings_url }
      format.json { head :ok }
    end
  end
end
