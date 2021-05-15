class ArticleSerializer < BaseSerializer
  attributes :description, :title
  set_type :article

  belongs_to :category
  has_many :comments
  belongs_to :store
end
