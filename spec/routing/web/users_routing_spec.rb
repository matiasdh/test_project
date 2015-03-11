require "rails_helper"

RSpec.describe Web::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/web/users").to route_to("web/users#index")
    end

    it "routes to #new" do
      expect(:get => "/web/users/new").to route_to("web/users#new")
    end

    it "routes to #show" do
      expect(:get => "/web/users/1").to route_to("web/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/web/users/1/edit").to route_to("web/users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/web/users").to route_to("web/users#create")
    end

    it "routes to #update" do
      expect(:put => "/web/users/1").to route_to("web/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/web/users/1").to route_to("web/users#destroy", :id => "1")
    end

  end
end
