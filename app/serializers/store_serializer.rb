class StoreSerializer < BaseSerializer
  attributes :name
  set_type :store

  attribute :name_with_year do |object|
    "#{object.name} (#{object.created_at})"
  end

  belongs_to :address
  has_many :articles
end
