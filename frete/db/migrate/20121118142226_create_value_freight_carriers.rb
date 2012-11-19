class CreateValueFreightCarriers < ActiveRecord::Migration
  def change
    create_table :value_freight_carriers do |t|
      t.integer :id_carrier
      t.integer :id_origin_city
      t.integer :id_destination_city
      t.integer :beginning_band
      t.integer :end_band
      t.float :value

      t.timestamps
    end
  end
end
