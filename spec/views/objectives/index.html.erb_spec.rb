require 'rails_helper'

RSpec.describe "objectives/index", type: :view do
  before(:each) do
    assign(:objectives, [
      Objective.create!(
        name: "Name",
        section: nil,
        percentage: 2.5
      ),
      Objective.create!(
        name: "Name",
        section: nil,
        percentage: 2.5
      )
    ])
  end

  it "renders a list of objectives" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
