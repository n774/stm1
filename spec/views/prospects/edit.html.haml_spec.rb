require 'spec_helper'

describe "prospects/edit" do
  before(:each) do
    @prospect = assign(:prospect, stub_model(Prospect,
      :aiit_member_id => 1,
      :wished_program => "MyString",
      :wished_material => "MyString",
      :event => "MyString",
      :contact_unnecessary => false,
      :applikation => "MyString",
      :memo => "MyText"
    ))
  end

  it "renders the edit prospect form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", prospect_path(@prospect), "post" do
      assert_select "input#prospect_aiit_member_id[name=?]", "prospect[aiit_member_id]"
      assert_select "input#prospect_wished_program[name=?]", "prospect[wished_program]"
      assert_select "input#prospect_wished_material[name=?]", "prospect[wished_material]"
      assert_select "input#prospect_event[name=?]", "prospect[event]"
      assert_select "input#prospect_contact_unnecessary[name=?]", "prospect[contact_unnecessary]"
      assert_select "input#prospect_applikation[name=?]", "prospect[applikation]"
      assert_select "textarea#prospect_memo[name=?]", "prospect[memo]"
    end
  end
end
