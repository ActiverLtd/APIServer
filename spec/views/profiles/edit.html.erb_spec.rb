require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :name => "MyString",
      :description => "MyText",
      :picture => "MyString",
      :range => 1,
      :rating_mean => 1.5,
      :rating_count => 1,
      :user_id => 1
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do
      assert_select "input#profile_name[name=?]", "profile[name]"
      assert_select "textarea#profile_description[name=?]", "profile[description]"
      assert_select "input#profile_picture[name=?]", "profile[picture]"
      assert_select "input#profile_range[name=?]", "profile[range]"
      assert_select "input#profile_rating_mean[name=?]", "profile[rating_mean]"
      assert_select "input#profile_rating_count[name=?]", "profile[rating_count]"
      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
    end
  end
end
