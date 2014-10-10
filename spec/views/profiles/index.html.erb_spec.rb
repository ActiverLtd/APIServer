require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :name => "Name",
        :description => "MyText",
        :picture => "Picture",
        :range => 1,
        :rating_mean => 1.5,
        :rating_count => 2,
        :user_id => 3
      ),
      stub_model(Profile,
        :name => "Name",
        :description => "MyText",
        :picture => "Picture",
        :range => 1,
        :rating_mean => 1.5,
        :rating_count => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
