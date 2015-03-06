require 'rails_helper'

RSpec.describe "suggestions/index", type: :view do
  before(:each) do
    assign(:suggestions, [
      Suggestion.create!(
        :activity_id => 1,
        :user_id => 2,
        :accepted => false
      ),
      Suggestion.create!(
        :activity_id => 1,
        :user_id => 2,
        :accepted => false
      )
    ])
  end

  it "renders a list of suggestions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
