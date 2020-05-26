require 'rails_helper'

RSpec.describe "sections/edit", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      name: "MyString",
      group: nil,
      percentage: 1.5,
      total_percentage: 1.5
    ))
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(@section), "post" do

      assert_select "input[name=?]", "section[name]"

      assert_select "input[name=?]", "section[group_id]"

      assert_select "input[name=?]", "section[percentage]"

      assert_select "input[name=?]", "section[total_percentage]"
    end
  end
end
