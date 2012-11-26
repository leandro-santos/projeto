class Carrier < ActiveRecord::Base
  attr_accessible :name, :address, :city_id, :zip_code, :site, :phone, :e_mail
  belongs_to :city
  has_one    :freight
  validates_presence_of  :name
end
