require 'spec_helper'

describe PagesController do

  before do
    @freight = FactoryGirl.create(:freight)
  end

  describe '#result' do
    it 'result of search' do
      post :result, {data:{origin_city: @freight.origin_city, destination_city: @freight.destination_city, weight: 20}}
    end

    it 'result of paginate' do
      get :result, {data:{origin_city: @freight.origin_city, destination_city: @freight.destination_city, weight: 20}}
    end

    it 'renders the result view' do
      get :result, {data:{origin_city: @freight.origin_city, destination_city: @freight.destination_city, weight: 20}}
      response.should render_template :result
    end

    it 'assigns the requested result to @result' do
      post :result, {data:{origin_city: @freight.origin_city, destination_city: @freight.destination_city, weight: 20}}
      assigns(:freights).should
      assigns(:data).should
    end
  end

  describe '#more' do
    it 'result of search' do
      get :more, {id: 1}
    end

    it 'renders the result view' do
      get :more, {id: 1}
      response.should render_template :more
    end

    it 'assigns the requested more to @more' do
      get :more, {id: 1}
      assigns(:freight).should
      assigns(:freights).should
    end
  end

end