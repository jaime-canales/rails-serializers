class Article < ApplicationRecord
  belongs_to :category
  has_many :comments
  belongs_to :store
end
