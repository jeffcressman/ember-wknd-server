class GuestSerializer < UserSerializer
  has_many :registrations
end
