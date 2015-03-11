require 'rails_helper'

RSpec.describe Web::HomeController, type: :controller do
  context 'Routes' do
    it 'should route to /landing' do
      expect(get: '/landing').to route_to(controller: 'web/home', action: 'landing')
    end

    it 'should route to /mytweets' do
      expect(get: '/mytweets').to route_to(controller: 'web/home', action: 'my_tweets')
    end
  end
end
