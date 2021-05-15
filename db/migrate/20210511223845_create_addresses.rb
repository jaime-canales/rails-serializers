class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.integer :code

      t.timestamps
    end
  end
end
