class AddSpeakerRefToWorkshops < ActiveRecord::Migration
  def change
    add_reference :workshops, :speaker, index: true
  end
end
