require 'rails_helper'

RSpec.describe "directs/new", type: :view do
	before(:each) do
		assign(:direct, Direct.new(
				:user_id => 1,
				:direct_id => 1
		))
	end

	it "renders new direct form" do
		render

		assert_select "form[action=?][method=?]", directs_path, "post" do

			assert_select "input#direct_user_id[name=?]", "direct[user_id]"

			assert_select "input#direct_direct_id[name=?]", "direct[direct_id]"
		end
	end
end
