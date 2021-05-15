module V2
  class AddressSerializer < ::ActiveModel::Serializer
    attributes :city, :code, :id

    has_many :stores, serializer: ::V2::StoreSerializer
  end
end
