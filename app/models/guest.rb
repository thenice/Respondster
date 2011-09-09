class Guest < ActiveRecord::Base
  
  has_one :guest_response
  has_many :flights
  has_many :hotel_bookings
  
  # create a GuestResponse for this guest on create
  after_create Proc.new { |g|
    r = GuestResponse.new(:guest_id => g.id)
    r.save(:validate => false)
  }
  
  def responded?
    guest_response.responded?
  end
  
  def attending?
     guest_response.number_attending > 0
  end
  
  def self.locate(first_initial,last_name, zipcode)
    return [] if ([first_initial,last_name].include? "")
    guests = Guest.find(:all,
    :conditions => [
      "(guest_name LIKE :name OR partner_name LIKE :name) ",
        { :name => "#{first_initial.first.capitalize}%#{last_name.capitalize}%"
        }]
    )
  end
  
end
