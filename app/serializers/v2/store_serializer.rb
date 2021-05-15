module V2
  class StoreSerializer < ActiveModel::Serializer
    attributes :id, :name, :name_with_year

    def name_with_year
      "#{object.name} (#{object.created_at})"
    end

    belongs_to :address, serializer: ::V2::AddressSerializer
    has_many :articles, serializer: ::V2::ArticleSerializer
  end
end
