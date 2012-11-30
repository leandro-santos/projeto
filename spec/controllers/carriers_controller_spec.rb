require 'spec_helper'

describe CarriersController do

  before do
    @carrier = FactoryGirl.create(:carrier)
    @carrier_two = FactoryGirl.create(:carrier)
  end

  describe 'GET #index' do
    it 'populates an hash of carrier' do
      get :index
      assigns(:carriers).should
    end

    it 'renders the index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET :edit' do
    it 'assigns the requested carrier to @carrier' do
      get :edit, {id: @carrier.id}
      assigns(:carrier).should == @carrier
    end

    it 'should render the edit template' do
      get :edit, {id: @carrier.id}
      response.should render_template('edit')
    end
  end

  describe 'GET :new' do
    it 'should render the new template' do
      get :new
      assigns(:carrier).should
      response.should render_template('new')
    end
  end

  describe 'TEST :destroy' do
    it 'deletes the selected carrier' do
      delete :destroy, id: @carrier.id
      Carrier.exists?(@carrier.id).should be_false
    end
    it 'redirects to the index page' do
      delete :destroy, id: @carrier.id
      response.should redirect_to(carriers_path)
    end
  end

  context 'with valid attributes PUT #update' do
    it 'assigns the requested carrier to @carrier' do
      put :update, id: @carrier.id
      assigns(:carrier).should == @carrier
    end
    it 'saves the new attributes from carrier on the existing carrier' do
      put :update, id: @carrier.id, carrier: FactoryGirl.attributes_for(:carrier, name: 'TranportadoraTeste', address: 'teste', city_id: 1, zip_code: '16.250-000', site: 'teste.com.br', phone: '(18) 9999-9999', e_mail: 'test@test.com')
      @carrier.reload
      @carrier.name.should == 'TranportadoraTeste'
      @carrier.address.should == 'teste'
      @carrier.city_id.should == 1
      @carrier.zip_code.should == '16.250-000'
      @carrier.site.should == 'teste.com.br'
      @carrier.phone.should == '(18) 9999-9999'
      @carrier.e_mail.should == 'test@test.com'
    end
    it 'redirects to the index page' do
      put :update, id: @carrier.id, carrier: FactoryGirl.attributes_for(:carrier)
      response.should redirect_to(carriers_path)
    end
  end
  context 'with invalid attributes' do
    it 'assigns the requested carrier to @carrier' do
      put :update, id: @carrier.id
      assigns(:carrier).should == @carrier
    end
    it 'saves the new attributes from carrier on the existing carrier' do
      put :update, id: @carrier.id, carrier: FactoryGirl.attributes_for(:invalid_carrier)
      @carrier.reload
      @carrier.name.should == @carrier.name
      @carrier.address.should == @carrier.address
      @carrier.city_id.should == @carrier.city_id
      @carrier.zip_code.should == @carrier.zip_code
      @carrier.site.should == @carrier.site
      @carrier.phone.should == @carrier.phone
      @carrier.e_mail.should == @carrier.e_mail
    end
    it 're-renders the edit page' do
      put :update, id: @carrier.id, carrier: FactoryGirl.attributes_for(:invalid_carrier)
      response.should render_template :edit
    end
  end

  context 'with valid attributes POST #create' do
    it 'saves the new carrier in the database' do
      post :create, carrier: FactoryGirl.attributes_for(:carrier)
      assigns(:carrier).should_not be_new_record
    end
    it 'redirects to the index page' do
      post :create, carrier: FactoryGirl.attributes_for(:carrier)
      response.should redirect_to(new_carrier_path)
    end
    it 'does not save the new carrier in the database' do
      post :create, carrier: FactoryGirl.attributes_for(:invalid_carrier)
      assigns(:carrier).should_not be_valid
    end
    it 're-renders the new page' do
      post :create, carrier: FactoryGirl.attributes_for(:invalid_carrier)
      response.should render_template :new
    end
  end
end