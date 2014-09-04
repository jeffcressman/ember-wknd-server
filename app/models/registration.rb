class Registration < ActiveRecord::Base
	belongs_to :guest
	belongs_to :workshop
end
