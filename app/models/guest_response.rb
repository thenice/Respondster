class GuestResponse < ActiveRecord::Base
  
  belongs_to :guest
    
  attr_accessor :responded
  
  def responded?
    @responded || number_attending.present?
  end
  
  
end
