require 'rails_helper'

RSpec.describe "objectives/new", type: :view do
  before(:each) do
    assign(:objective, Objective.new(
      name: "MyString",
      section: nil,
      percentage: 1.5
    ))
  end

  it "renders new objective form" do
    render

    assert_select "form[action=?][method=?]", objectives_path, "post" do

      assert_select "input[name=?]", "objective[name]"

      assert_select "input[name=?]", "objective[section_id]"

      assert_select "input[name=?]", "objective[percentage]"
    end
  end
end
