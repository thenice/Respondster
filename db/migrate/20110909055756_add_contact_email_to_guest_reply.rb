class AddContactEmailToGuestReply < ActiveRecord::Migration
  def change
    add_column :guest_responses, :contact_email, :string
  end
end
