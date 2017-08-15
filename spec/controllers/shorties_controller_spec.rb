require 'rails_helper'

RSpec.describe ShortiesController, type: :controller do
  let(:valid_shorty) { FactoryGirl.create(:shorty) }

  describe '#create' do
    it 'creates a new shorty url' do
      expect{
        post :create, params: { shorty: {original: 'www.google.com/whatever' } }
      }.to change(Shorty,:count).by(1)
    end
  end

  describe 'GET #show' do
    it 'redirects with 301 when there is a valid key' do
      get :show, params: { unique_key: valid_shorty.shortened }
      expect(response).to have_http_status(301)
    end

    it 'redirects with 302 if there is not a valid key' do
      get :show, params: { unique_key: 'notvalidkey' }
      expect(response).to have_http_status(302)
    end
  end
end
