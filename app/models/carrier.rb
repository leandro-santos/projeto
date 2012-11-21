class Carrier < ActiveRecord::Base
  attr_accessible :name, :address, :city_id, :zip_code, :site, :phone, :e_mail
  belongs_to :city
  has_many   :freight, foreign_key: "carrier"
  validates  :name, :presence => true

end
