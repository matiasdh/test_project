require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  context 'Routes' do
    it 'should route to /users' do
      expect(get: '/api/v1/users/1').to route_to(controller: 'api/v1/users', action: 'show', id: '1')
    end
  end

  context 'GET users' do
    it 'should show the user with ID :id' do
      user = create :logged_user, password: 'password'
      get :show, id: user.id, token: user.session_token
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response['user']['id']).to be user.id
    end
  end
end
