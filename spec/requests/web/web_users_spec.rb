require 'rails_helper'

RSpec.describe "Web::Users", type: :request do
  describe "GET /web_users" do
    it "works! (now write some real specs)" do
      get web_users_path
      expect(response).to have_http_status(200)
    end
  end
end
