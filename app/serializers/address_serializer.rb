class AddressSerializer < BaseSerializer
  attributes :city, :code
  set_type :address

  has_many :stores
end
