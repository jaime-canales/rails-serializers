class CommentSerializer < BaseSerializer
  attributes :desc
  set_type :comment

  belongs_to :article
end
