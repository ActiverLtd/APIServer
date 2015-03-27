require 'spec_helper'

RSpec.describe "suggestions/show", type: :view do
  before(:each) do
    @suggestion = assign(:suggestion, Suggestion.create!(
      :activity_id => 1,
      :user_id => 2,
      :accepted => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
