require 'factory_girl'

FactoryGirl.define do
  factory :value_freight_carriers, class: 'ValueFreightCarriers' do
    id_carrier { Faker::Array.rand }
    id_origin_city { Faker::Array.rand }
    id_destination_city { Faker::Array.rand }
    beginning_band { Faker::Array.rand }
    end_band { Faker::Array.rand }
    value { Faker::Name.name }
  end
end