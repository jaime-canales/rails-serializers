class TagSerializer
  include JSONAPI::Serializer
  attributes :name
  set_type :tag

  belongs_to :series
end
