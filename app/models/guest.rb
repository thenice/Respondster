class Guest < ActiveRecord::Base
  
  has_one :guest_response
  has_many :flights
  has_many :hotel_bookings
  
  # create a GuestResponse for this guest on create
  after_create Proc.new { |g| g.guest_response = GuestResponse.create }
  
  def responded?
    guest_response.responded?
  end
  
  def self.locate(first_initial,last_name, zipcode)
    return [] if ([first_initial,last_name, zipcode].include? "")
    guests = Guest.find(:all,
    :conditions => [
      "(guest_name LIKE :name OR partner_name LIKE :name) AND zipcode = :zipcode",
        { :name => "#{first_initial.first.capitalize}%#{last_name.capitalize}%",
          :zipcode => zipcode
        }]
    )
  end
  
end
