require 'factory_girl'

FactoryGirl.define do
  factory :city do
    name { Faker::Address.city }
    city { 1 }
  end
end