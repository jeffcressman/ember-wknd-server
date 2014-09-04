class Guest < User
	has_many :registrations, dependent: :destroy
end
