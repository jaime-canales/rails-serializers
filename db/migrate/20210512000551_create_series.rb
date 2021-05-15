class CreateSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :series do |t|
      t.string :name
      t.date :release_date
      t.string :description

      t.timestamps
    end
  end
end
