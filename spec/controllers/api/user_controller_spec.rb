require 'rails_helper'

RSpec.describe Api::UserController, type: :controller do
  describe 'GET #info' do
    it 'returns http success' do
      get :info
      expect(response).to have_http_status(401)
    end
  end
end
