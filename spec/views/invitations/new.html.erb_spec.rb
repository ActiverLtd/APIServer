require 'rails_helper'

RSpec.describe "suggestions/new", type: :view do
  before(:each) do
    assign(:suggestion, Suggestion.new(
      :activity_id => 1,
      :user_id => 1,
      :accepted => false
    ))
  end

  it "renders new suggestion form" do
    render

    assert_select "form[action=?][method=?]", suggestions_path, "post" do

      assert_select "input#suggestion_activity_id[name=?]", "suggestion[activity_id]"

      assert_select "input#suggestion_user_id[name=?]", "suggestion[user_id]"

      assert_select "input#suggestion_accepted[name=?]", "suggestion[accepted]"
    end
  end
end
