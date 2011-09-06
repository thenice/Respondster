class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :guest_id
      t.string :passenger_name
      t.string :airline
      t.string :flight_number
      t.string :departure_city
      t.string :arrival_city
      t.datetime :departure_time
      t.datetime :arrival_time
      t.boolean :inbound

      t.timestamps
    end
  end
end
