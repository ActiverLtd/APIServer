require 'rails_helper'

RSpec.describe "suggestions/edit", type: :view do
  before(:each) do
    @suggestion = assign(:suggestion, Suggestion.create!(
      :activity_id => 1,
      :user_id => 1,
      :accepted => false
    ))
  end

  it "renders the edit suggestion form" do
    render

    assert_select "form[action=?][method=?]", suggestion_path(@suggestion), "post" do

      assert_select "input#suggestion_activity_id[name=?]", "suggestion[activity_id]"

      assert_select "input#suggestion_user_id[name=?]", "suggestion[user_id]"

      assert_select "input#suggestion_accepted[name=?]", "suggestion[accepted]"
    end
  end
end
