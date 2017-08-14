require 'rails_helper'

RSpec.describe ShortiesController, type: :controller do

  describe '#create' do
    it 'creates a new shorty url' do
      expect{
        post :create, params: { url: 'www.google.com/whatever' }
      }.to change(Shorty,:count).by(1)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
