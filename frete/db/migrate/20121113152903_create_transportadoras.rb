class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :site
      t.string :phone
      t.string :e_mail

      t.timestamps
    end
  end
end
