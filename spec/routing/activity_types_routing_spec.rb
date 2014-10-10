require "spec_helper"

describe ActivityTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/activity_types").should route_to("activity_types#index")
    end

    it "routes to #new" do
      get("/activity_types/new").should route_to("activity_types#new")
    end

    it "routes to #show" do
      get("/activity_types/1").should route_to("activity_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/activity_types/1/edit").should route_to("activity_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/activity_types").should route_to("activity_types#create")
    end

    it "routes to #update" do
      put("/activity_types/1").should route_to("activity_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/activity_types/1").should route_to("activity_types#destroy", :id => "1")
    end

  end
end
