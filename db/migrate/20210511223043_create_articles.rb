class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :description
      t.text :title
      t.integer :category_id

      t.timestamps
    end
  end
end
