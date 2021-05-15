class Store < ApplicationRecord
  self.per_page = 10
  belongs_to :address
  has_many :articles
end
