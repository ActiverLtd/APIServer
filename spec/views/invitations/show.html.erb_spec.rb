require 'rails_helper'

RSpec.describe "invitations/show", type: :view do
  before(:each) do
    @invitation = assign(:invitation, Invitation.create!(
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