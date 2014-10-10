require 'spec_helper'

describe "activity_types/edit" do
  before(:each) do
    @activity_type = assign(:activity_type, stub_model(ActivityType,
      :name => "MyString"
    ))
  end

  it "renders the edit activity_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", activity_type_path(@activity_type), "post" do
      assert_select "input#activity_type_name[name=?]", "activity_type[name]"
    end
  end
end
