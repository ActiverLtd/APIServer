# spec/requests/users_spec.rb
require("spec_helper")
describe "Users API" do
	describe "GET /users" do
		it "returns all the users" do
			FactoryGirl.create :user, name: "user1"
			FactoryGirl.create :user, name: "user2"

			get "/users", {}, { "Accept" => "application/json" }

			expect(response.status).to eq 200

			body = JSON.parse(response.body)
			user_names = body.map { |m| m["name"] }

			expect(user_names).to match_array(["user1", "user22"])
		end
	end
end
