class CreateHotelBookings < ActiveRecord::Migration
  def change
    create_table :hotel_bookings do |t|
      t.integer :guest_id
      t.string :guest_name
      t.string :hotel_name
      t.datetime :check_in
      t.datetime :check_out
      t.string :status

      t.timestamps
    end
  end
end
