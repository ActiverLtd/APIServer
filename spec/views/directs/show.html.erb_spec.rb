require 'rails_helper'

RSpec.describe "directs/show", type: :view do
	before(:each) do
		@direct = assign(:direct, Direct.create!(
				:user_id => 1,
				:direct_id => 2
		))
	end

	it "renders attributes in <p>" do
		render
		expect(rendered).to match(/1/)
		expect(rendered).to match(/2/)
	end
end
