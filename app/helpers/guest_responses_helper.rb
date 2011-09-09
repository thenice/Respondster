module GuestResponsesHelper

def number_of_guests_message(guest)
  if @guest.guest_response.number_attending > 0
    image_tag("big_yes.png") + "<br />#{pluralize(guest.guest_response.number_attending, "guest")} confirmed.".html_safe
  elsif @guest.guest_response.number_attending == 0
    image_tag("big_no.png") + "<br />Guest has declined.".html_safe
  else
    "Guest has not responded."
  end
end
  
end
