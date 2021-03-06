require 'rails_helper'

RSpec.describe "sections/new", type: :view do
  before(:each) do
    assign(:section, Section.new(
      name: "MyString",
      group: nil,
      percentage: 1.5,
      total_percentage: 1.5
    ))
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do

      assert_select "input[name=?]", "section[name]"

      assert_select "input[name=?]", "section[group_id]"

      assert_select "input[name=?]", "section[percentage]"

      assert_select "input[name=?]", "section[total_percentage]"
    end
  end
end
