class CreateGuestResponses < ActiveRecord::Migration
  def change
    create_table :guest_responses do |t|
      t.integer :guest_id
      t.integer :number_attending

      t.timestamps
    end
  end
end
