module V2
  class CategorySerializer < ::ActiveModel::Serializer
    attributes :id, :name

    has_many :articles, serializer: ::V2::ArticleSerializer
  end
end
