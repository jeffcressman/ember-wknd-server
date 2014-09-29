class Workshop < ActiveRecord::Base
	belongs_to :speaker
	has_many :registrations, dependent: :destroy
end
