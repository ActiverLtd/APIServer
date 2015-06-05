require "rails_helper"

RSpec.describe DirectsController, type: :routing do
	describe "routing" do

		it "routes to #index" do
			expect(:get => "/directs").to route_to("directs#index")
		end

		it "routes to #new" do
			expect(:get => "/directs/new").to route_to("directs#new")
		end

		it "routes to #show" do
			expect(:get => "/directs/1").to route_to("directs#show", :id => "1")
		end

		it "routes to #edit" do
			expect(:get => "/directs/1/edit").to route_to("directs#edit", :id => "1")
		end

		it "routes to #create" do
			expect(:post => "/directs").to route_to("directs#create")
		end

		it "routes to #update" do
			expect(:put => "/directs/1").to route_to("directs#update", :id => "1")
		end

		it "routes to #destroy" do
			expect(:delete => "/directs/1").to route_to("directs#destroy", :id => "1")
		end

	end
end
