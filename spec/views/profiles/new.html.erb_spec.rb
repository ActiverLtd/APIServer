require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :name => "MyString",
      :description => "MyText",
      :picture => "MyString",
      :range => 1,
      :rating_mean => 1.5,
      :rating_count => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profiles_path, "post" do
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
