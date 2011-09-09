class FlightsController < ApplicationController
  # GET /flights
  # GET /flights.json


  # GET /flights/1
  # GET /flights/1.json
  def show
    @flight = Flight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flight }
    end
  end

  # GET /flights/new
  # GET /flights/new.json
  
  def new_inbound
    @flight = Flight.new(:inbound => true)
    render :new
  end
  
  def new_departing
    @flight = Flight.new(:inbound => false)
    render :new
  end
  
  def new
    @flight = Flight.new(:inbound => false)
  end

  # GET /flights/1/edit
  def edit
    @flight = Flight.find(params[:id])
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(params[:flight])
    @guest = Guest.find(session[:guest_id])
    @flight.inbound = (params[:inbound] == "1")
      if @flight.save
        @guest.flights << @flight
      else
      end
  end

  # PUT /flights/1
  # PUT /flights/1.json
  def update
    @flight = Flight.find(params[:id])
    if @flight.update_attributes(params[:flight])
    else
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
  end
  
end
