class SpeakerSerializer < UserSerializer
  attributes :bio
  has_many :workshops
end
