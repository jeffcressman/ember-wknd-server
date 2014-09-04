class AddGuestRefToRegistrations < ActiveRecord::Migration
  def change
    add_reference :registrations, :guest, index: true
  end
end
