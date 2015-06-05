require 'rails_helper'

RSpec.describe "directs/index", type: :view do
	before(:each) do
		assign(:directs, [
				Direct.create!(
						:user_id => 1,
						:direct_id => 2
				),
				Direct.create!(
						:user_id => 1,
						:direct_id => 2
				)
		])
	end

	it "renders a list of directs" do
		render
		assert_select "tr>td", :text => 1.to_s, :count => 2
		assert_select "tr>td", :text => 2.to_s, :count => 2
	end
end
