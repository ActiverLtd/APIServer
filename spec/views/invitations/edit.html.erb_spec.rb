require 'rails_helper'

RSpec.describe "invitations/edit", type: :view do
  before(:each) do
    @invitation = assign(:invitation, Invitation.create!(
      :activity_id => 1,
      :user_id => 1,
      :accepted => false
    ))
  end

  it "renders the edit invitation form" do
    render

    assert_select "form[action=?][method=?]", invitation_path(@invitation), "post" do

      assert_select "input#invitation_activity_id[name=?]", "invitation[activity_id]"

      assert_select "input#invitation_user_id[name=?]", "invitation[user_id]"

      assert_select "input#invitation_accepted[name=?]", "invitation[accepted]"
    end
  end
end
