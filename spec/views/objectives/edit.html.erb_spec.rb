require 'rails_helper'

RSpec.describe "objectives/edit", type: :view do
  before(:each) do
    @objective = assign(:objective, Objective.create!(
      name: "MyString",
      section: nil,
      percentage: 1.5
    ))
  end

  it "renders the edit objective form" do
    render

    assert_select "form[action=?][method=?]", objective_path(@objective), "post" do

      assert_select "input[name=?]", "objective[name]"

      assert_select "input[name=?]", "objective[section_id]"

      assert_select "input[name=?]", "objective[percentage]"
    end
  end
end
