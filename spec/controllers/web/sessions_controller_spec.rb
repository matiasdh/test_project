require 'rails_helper'

RSpec.describe Web::SessionsController, type: :controller do
  context 'Routes' do
    it 'should route to /login' do
      expect(get: '/login').to route_to(controller: 'web/sessions', action: 'new')
    end

    it 'should route to /logout' do
      expect(get: '/logout').to route_to(controller: 'web/sessions', action: 'destroy')
    end
  end
end
