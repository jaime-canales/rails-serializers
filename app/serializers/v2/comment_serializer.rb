module V2
  class CommentSerializer < ::ActiveModel::Serializer
    attributes :id, :desc

    belongs_to :article, serializer: ::V2::ArticleSerializer
  end
end
