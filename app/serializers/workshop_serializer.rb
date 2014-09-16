class WorkshopSerializer <  ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :name, :description
  # the model specifies belongs_to but it doesn't work here. has_one does.
  # apparently the wording 'has_one' doesn't mean the same thing as in ActiveRecord terminology
  # http://stackoverflow.com/questions/13125214/active-model-serializers-belongs-to
  has_one :speaker 
  has_many :registrations
end
