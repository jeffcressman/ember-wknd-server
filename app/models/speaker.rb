class Speaker < User
	has_many :workshops, dependent: :destroy
end
