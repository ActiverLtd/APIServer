# spec/requests/users_spec.rb
require("spec_helper")
describe "Users API" do
	describe "GET /users" do
		it "returns all the users" do
			user1 = FactoryGirl.create :user
			user2 = FactoryGirl.create :user

			get "/users", {}, { "Accept" => "application/json", "X-User-Token" => user1.authentication_token, "X-User-Email" => user1.email }
			expect(response.status).to eq 200

			emails = json.map { |m| m["email"] }

			expect(emails).to match_array(["person1@example.com", "person2@example.com"])
		end
		it "can't be accessed without token and email" do
			get "/users", {}, { "Accept" => "application/json" }
			expect(response.status).to eq 401
		end
	end

	describe "POST /users" do
		it "doesn't allow 2 users with same email" do
			user1 = FactoryGirl.create :user
			post "/users", { :user => { :email => user1.email, :password => "aaaaaaaaaaa"} }, { "Accept" => "application/json", "X-User-Token" => user1.authentication_token, "X-User-Email" => user1.email }
			expect(response.status).to eq 422 # Unprocessable entity
		end
		it "doesn't allow empty email nor password" do
			user1 = FactoryGirl.create :user
			post "/users", { :user => { :email => "", :password => "aaaaaaaaaaa"} }, { "Accept" => "application/json", "X-User-Token" => user1.authentication_token, "X-User-Email" => user1.email }
			expect(response.status).to eq 422 # Unprocessable entity

			post "/users", { :user => { :email => "random@example.com", :password => ""} }, { "Accept" => "application/json", "X-User-Token" => user1.authentication_token, "X-User-Email" => user1.email }
			expect(response.status).to eq 422 # Unprocessable entity
		end
		it "doesn't allow too weak password" do
			user1 = FactoryGirl.create :user
			post "/users", { :user => { :email => "random@example.com", :password => "abc"} }, { "Accept" => "application/json", "X-User-Token" => user1.authentication_token, "X-User-Email" => user1.email }
			expect(response.status).to eq 422 # Unprocessable entity
		end
	end
end
