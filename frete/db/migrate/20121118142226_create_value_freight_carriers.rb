class CreateValueFreightCarriers < ActiveRecord::Migration
  def change
    create_table :value_freight_carriers do |t|

      t.timestamps
    end
  end
end
