require 'rails_helper'

RSpec.describe "directs/edit", type: :view do
	before(:each) do
		@direct = assign(:direct, Direct.create!(
				:user_id => 1,
				:direct_id => 1
		))
	end

	it "renders the edit direct form" do
		render

		assert_select "form[action=?][method=?]", direct_path(@direct), "post" do

			assert_select "input#direct_user_id[name=?]", "direct[user_id]"

			assert_select "input#direct_direct_id[name=?]", "direct[direct_id]"
		end
	end
end
