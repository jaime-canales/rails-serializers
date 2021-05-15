module V2
  class ArticleSerializer < ::ActiveModel::Serializer
    attributes :id, :description, :title

    belongs_to :category, serializer: ::V2::CategorySerializer
    has_many :comments, serializer: ::V2::CommentSerializer
    belongs_to :store, serializer: ::V2::StoreSerializer
  end
end
