require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  context 'Routes' do
    it 'should route to /login' do
      expect(post: '/api/v1/login').to route_to(controller: 'api/v1/sessions', action: 'login')
    end

  end

  describe 'POST login' do
    it 'should login a user when a valid email and password are given' do
      user = create :user, password: 'password'
      post :login, email: user.email, password: 'password'
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response['user']['id']).to be user.id
    end

    it 'should return an error if a wrong email is given' do
      user = create :user, password: 'password'
      post :login, email: 'wrong_email@test.com', password: 'password'
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(401)
      expect(parsed_response['errors']).to eq 'Invalid username or password'
    end

    it 'should return an error if a wrong password is given' do
      user = create :user, password: 'password'
      post :login, email: 'user.email', password: 'wrong_password'
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(401)
      expect(parsed_response['errors']).to eq 'Invalid username or password'
    end
  end
end
