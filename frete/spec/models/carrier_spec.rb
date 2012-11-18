require 'spec_helper'

describe Carrier do

  it 'should have a valid generator' do
    FactoryGirl.create(:carrier).should be_valid
  end

  it 'should have name' do
    FactoryGirl.build(:carrier, name: nil).should_not be_valid
  end

  it 'don not need a address' do
    FactoryGirl.build(:carrier, address: nil).should be_valid
  end

  it 'don not need a city' do
    FactoryGirl.build(:carrier, city: nil).should be_valid
  end

  it 'don not need a zip_code' do
    FactoryGirl.build(:carrier, zip_code: nil).should be_valid
  end

  it 'don not need a site' do
    FactoryGirl.build(:carrier, site: nil).should be_valid
  end

  it 'don not need a phone' do
    FactoryGirl.build(:carrier, phone: nil).should be_valid
  end

  it 'don not need a e_mail' do
    FactoryGirl.build(:carrier, e_mail: nil).should be_valid
  end

end