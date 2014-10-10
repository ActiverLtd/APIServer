require 'spec_helper'

describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :activity_type_id => 1,
      :organizer => 1,
      :message => "MyText"
    ))
  end

  it "renders the edit activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do
      assert_select "input#activity_activity_type_id[name=?]", "activity[activity_type_id]"
      assert_select "input#activity_organizer[name=?]", "activity[organizer]"
      assert_select "textarea#activity_message[name=?]", "activity[message]"
    end
  end
end
