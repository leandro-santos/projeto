require 'spec_helper'

describe FreightsController do

  before do
    @freight = FactoryGirl.create(:freight)
  end

  describe 'GET #index' do
    it 'populates an hash of freight' do
      get :index
      assigns(:freights).should
    end

    it 'renders the index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET :edit' do
    it 'assigns the requested freight to @freight' do
      get :edit, {id: @freight.id}
      assigns(:freight).should == @freight
    end

    it 'should render the edit template' do
      get :edit, {id: @freight.id}
      response.should render_template('edit')
    end
  end

  describe 'GET :new' do
    it 'should render the new template' do
      get :new
      assigns(:freight).should
      response.should render_template('new')
    end
  end

  describe 'TEST :destroy' do
    it 'deletes the selected freight' do
      delete :destroy, id: @freight.id
      Freight.exists?(@freight.id).should be_false
    end
    it 'redirects to the index page' do
      delete :destroy, id: @freight.id
      response.should redirect_to(freights_path)
    end
  end

  context 'with valid attributes PUT #update' do
    it 'assigns the requested freight to @freight' do
      put :update, id: @freight.id
      assigns(:freight).should == @freight
    end
    it 'saves the new attributes from freight on the existing freight' do
      put :update, id: @freight.id, freight: FactoryGirl.attributes_for(:freight, carrier_id: 2, origin_city_id: 2, destination_city_id: 2, start_weight: 2, end_weight: 22, value: 22)
      @freight.reload
      @freight.carrier_id.should == 2
      @freight.origin_city_id.should == 2
      @freight.destination_city_id.should == 2
      @freight.start_weight.should == 2
      @freight.end_weight.should == 22
      @freight.value.should == 22
    end
    it 'redirects to the index page' do
      put :update, id: @freight.id, freight: FactoryGirl.attributes_for(:freight)
      response.should redirect_to(freights_path)
    end
  end
  context 'with invalid attributes' do
    it 'assigns the requested freight to @freight' do
      put :update, id: @freight.id
      assigns(:freight).should == @freight
    end
    it 'saves the new attributes from freight on the existing freight' do
      put :update, id: @freight.id, freight: FactoryGirl.attributes_for(:invalid_freight)
      @freight.reload
      @freight.carrier_id.should == @freight.carrier_id
      @freight.origin_city_id.should == @freight.origin_city_id
      @freight.destination_city_id.should == @freight.destination_city_id
      @freight.start_weight.should == @freight.start_weight
      @freight.end_weight.should == @freight.end_weight
      @freight.value.should == @freight.value
    end
    it 're-renders the edit page' do
      put :update, id: @freight.id, freight: FactoryGirl.attributes_for(:invalid_freight)
      response.should render_template :edit
    end
  end

  context 'with valid attributes POST #create' do
    it 'saves the new freight in the database' do
      post :create, freight: FactoryGirl.attributes_for(:freight)
      assigns(:freight).should_not be_new_record
    end
    it 'redirects to the index page' do
      post :create, freight: FactoryGirl.attributes_for(:freight)
      response.should redirect_to(new_freight_path)
    end
    it 'does not save the new freight in the database' do
      post :create, freight: FactoryGirl.attributes_for(:invalid_freight)
      assigns(:freight).should_not be_valid
    end
    it 're-renders the new page' do
      post :create, freight: FactoryGirl.attributes_for(:invalid_freight)
      response.should render_template :new
    end
  end

end