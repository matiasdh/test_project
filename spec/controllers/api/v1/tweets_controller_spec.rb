require 'rails_helper'

RSpec.describe Api::V1::TweetsController, type: :controller do
  context 'Routes' do
    it 'should route to tweets#show' do
      expect(get: '/api/v1/tweets/1').to route_to(controller: 'api/v1/tweets', action: 'show', id: '1')
    end

    it 'should route to tweets#index' do
      expect(get: '/api/v1/tweets').to route_to(controller: 'api/v1/tweets', action: 'index')
    end

    it 'should route to tweets#create' do
      expect(post: '/api/v1/tweets').to route_to(controller: 'api/v1/tweets', action: 'create')
    end

    it 'should route to tweets#update' do
      expect(put: '/api/v1/tweets/1').to route_to(controller: 'api/v1/tweets', action: 'update', id: '1')
    end

    it 'should route to tweets#destroy' do
      expect(delete: '/api/v1/tweets/1').to route_to(controller: 'api/v1/tweets', action: 'destroy', id: '1')
    end
  end

  context 'Actions' do
    it 'should show the tweet with ID :id' do
      user = create :user_with_tweets, password: 'test_password'
      get :show, id: user.tweets.first.id, token: user.session_token
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(parsed_response['tweet']['id']).to be user.tweets.first.id
    end

    it 'should show all the tweets' do
      user = create :user_with_tweets, password: 'test_password'
      get :index, token: user.session_token
      parsed_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end

    it 'should cretae a new tweet' do
      user = create :user_with_tweets, password: 'test_password'
      post :create, token: user.session_token, tweet: {"text": "new tweet for tests"}
      parsed_response = JSON.parse(response.body)
      expect(user.tweets.count).to eq 3
    end

    it 'should update the text of te tweet with ID :id' do
      user = create :user_with_tweets, password: 'test_password'
      to_update = user.tweets.first.id
      put :update, id: to_update, token: user.session_token, tweet: {"text": "updated text"}
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['tweet']['text']).to eq "updated text"
    end

    it 'should destroy the tweet with ID :id' do
      user = create :user_with_tweets, password: 'test_password'
      to_delete = user.tweets.first.id
      delete :destroy, id: to_delete, token: user.session_token
      expect(user.tweets.count).to eq 1
    end
  end
end
