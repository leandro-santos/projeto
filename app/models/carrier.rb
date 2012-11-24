class Carrier < ActiveRecord::Base
  attr_accessible :name, :address, :city, :zip_code, :site, :phone, :e_mail
  belongs_to :city
  has_one    :freight
  validates  :name, :presence => true

end
