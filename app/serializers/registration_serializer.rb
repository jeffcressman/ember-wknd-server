class RegistrationSerializer < ActiveModel::Serializer
	embed :ids, include: true
  attributes :id, :name
  has_one :guest
	has_one :workshop
end
