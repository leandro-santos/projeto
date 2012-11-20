class CreateFreights < ActiveRecord::Migration
  def change
    create_table :freights do |t|
      t.references :carrier
      t.references :origin_city
      t.references :destination_city
      t.integer    :start_weight
      t.integer    :end_weight
      t.float      :value

      t.timestamps
    end
  end
end
