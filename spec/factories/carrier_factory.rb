require 'factory_girl'

FactoryGirl.define do
  factory :carrier, class: 'Carrier' do
    name { Faker::Name.name }
    address { Faker::Address.name }
    city { 1 }
    zip_code { Faker::Address.zip_code }
    site { Faker::Internet.domain_word }
    phone { Faker::Name.name }
    e_mail { Faker::PhoneNumber.phone_number }
  end
end