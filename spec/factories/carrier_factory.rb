require 'factory_girl'

FactoryGirl.define do
  factory :carrier, class: 'Carrier' do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    city_id { City.first.id }
    zip_code { '16.250-000' }
    site { Faker::Internet.domain_name }
    phone { Faker::PhoneNumber.phone_number }
    e_mail { Faker::Internet.email }
  end
  factory :invalid_carrier, parent: :carrier do
    name nil
    address nil
    city_id nil
    zip_code nil
    site nil
    phone nil
    e_mail nil
  end
end