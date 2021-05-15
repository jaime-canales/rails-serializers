class ChangeAddressIdToIntegerInStore < ActiveRecord::Migration[6.1]
  def change
    change_column :stores, :address_id, 'integer USING address_id::integer'
  end
end
