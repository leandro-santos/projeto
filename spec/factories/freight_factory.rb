require 'factory_girl'

FactoryGirl.define do
  factory :freight, class: 'Freight' do
    carrier_id { Carrier.first.id }
    origin_city_id { City.first.id }
    destination_city_id { City.first.id }
    start_weight { 1 }
    end_weight { 10 }
    value { 23 }
  end
  factory :invalid_freight, parent: :freight do
    carrier_id nil
    origin_city_id nil
    destination_city_id nil
    start_weight nil
    end_weight nil
    value nil
  end
end