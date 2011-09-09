class GuestResponse < ActiveRecord::Base
  
  belongs_to :guest
  
  validates :number_attending, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => Proc.new { |gr| gr.guest.number_of_guests } }
    
  attr_accessor :responded
  
  def responded?
    @responded || number_attending.present?
  end
  
  def allowed_guests
    guest.number_of_guests
  end
  
  
end
