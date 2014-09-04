class AddWorkshopRefToRegistration < ActiveRecord::Migration
  def change
    add_reference :registrations, :workshop, index: true
  end
end
