class GuestResponsesController < ApplicationController
  # GET /guest_responses
  # GET /guest_responses.json
  def index
    @guest_responses = GuestResponse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guest_responses }
    end
  end

  # GET /guest_responses/1
  # GET /guest_responses/1.json
  def show
    @guest = Guest.find(session[:guest_id])
    @guest_response = @guest.guest_response
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guest_response }
    end
  end

  # GET /guest_responses/new
  # GET /guest_responses/new.json
  def new
    session[:guests] = nil
    @guest_response = GuestResponse.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guest_response }
    end
  end

  # GET /guest_responses/1/edit
  def edit
    @guest_response = GuestResponse.find(params[:id])
    redirect_to(@guest_response) if (@guest_response.responded?)
  end

  # POST /guest_responses
  # POST /guest_responses.json
  def create
    @guest_response = GuestResponse.new(params[:guest_response])
    respond_to do |format|
      if @guest_response.save
        format.html { redirect_to @guest_response, notice: 'Guest response was successfully created.' }
        format.json { render json: @guest_response, status: :created, location: @guest_response }
      else
        format.html { render action: "new" }
        format.json { render json: @guest_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guest_responses/1
  # PUT /guest_responses/1.json
  def update
    @guest_response = GuestResponse.find(params[:id])

    respond_to do |format|
      if @guest_response.update_attributes(params[:guest_response])
        format.html { redirect_to @guest_response, notice: 'Guest response was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @guest_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_responses/1
  # DELETE /guest_responses/1.json
  def destroy
    @guest_response = GuestResponse.find(params[:id])
    @guest_response.destroy

    respond_to do |format|
      format.html { redirect_to guest_responses_url }
      format.json { head :ok }
    end
  end
end
