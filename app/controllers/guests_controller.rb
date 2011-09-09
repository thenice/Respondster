class GuestsController < ApplicationController

  def new
  end

  def locate
     guests = Guest.locate(params[:first_initial], params[:last_name], params[:zipcode])
     if (guests.size>0)
       session[:guests] = guests
       redirect_to(list_matches_path)
     else
       redirect_to(new_guest_response_url, :alert => "No guest found.")
     end
  end
  
  def list_matches
    @guests = session[:guests]
  end
  
  def select_match
    session[:guest_id] = params[:guests]
    puts "USING GUEST ID: #{params[:guests]}"
    session[:guests] = nil
    redirect_to_dashboard
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(params[:guest])
    respond_to do |format|
      if params[:first_initial].present?
        redirect_to(locate_guest_path)
      elsif @guest.save
        format.html { redirect_to @guest, notice: 'Guest was successfully created.' }
        format.json { render json: @guest, status: :created, location: @guest }
      else
        format.html { render action: "new" }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PUT /guests/1
  # PUT /guests/1.json
  def update
    @guest = Guest.find(params[:id])

    respond_to do |format|
      if @guest.update_attributes(params[:guest])
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy

    respond_to do |format|
      format.html { redirect_to guests_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def redirect_to_dashboard
    @guest = Guest.find(session[:guest_id])
    if (not @guest.responded?)
      path = edit_guest_response_path(@guest.guest_response)
      alert = "Hello, #{@guest.guest_name}, Please respond below."
    else
      path = guest_response_path(@guest.guest_response)
      alert = "Welcome back, #{@guest.guest_name}. You can edit your travel details below."
    end
    redirect_to(path, :alert => alert)
  end
  
end
