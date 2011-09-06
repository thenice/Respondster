class AddDifferentNameFieldsToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :partner_name, :string
    add_column :guests, :guest_name, :string
    add_column :guests, :name_on_envelope, :string
    
    remove_column :guests, :name
  end
end
