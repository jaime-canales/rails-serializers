class CategorySerializer < BaseSerializer
  attributes :name
  set_type :category

  has_many :articles
end
