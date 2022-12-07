class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|

      t.string :post_code,             null: false
      t.integer :area_id,              null: false
      t.integer :municipality,         null: false
      t.integer :address,              null: false
      t.integer :building_name
      t.string :phone_number,          null: false
      t.references :shipping_address,  null: false, foreign_key: true 



      t.timestamps
    end
  end
end