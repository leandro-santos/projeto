require 'spec_helper'

describe ValueFreightCarrier do

it 'should have a valid generator' do
    FactoryGirl.create(:value_freight_carrier).should be_valid
  end

  it 'should have id_carrier' do
    FactoryGirl.build(:value_freight_carrier, id_carrier: nil).should_not be_valid
  end

  it 'should have id_origin_city' do
    FactoryGirl.build(:value_freight_carrier, id_origin_city: nil).should_not be_valid
  end

  it 'should have id_destination_city' do
    FactoryGirl.build(:value_freight_carrier, id_destination_city: nil).should_not be_valid
  end

  it 'should have beginning_band' do
    FactoryGirl.build(:value_freight_carrier, beginning_band: nil).should_not be_valid
  end

  it 'should have end_band' do
    FactoryGirl.build(:value_freight_carrier, end_band: nil).should_not be_valid
  end

  it 'should have value' do
    FactoryGirl.build(:value_freight_carrier, value: nil).should_not be_valid
  end

end
