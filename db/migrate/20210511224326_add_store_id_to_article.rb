class AddStoreIdToArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :store, index: true
  end
end
