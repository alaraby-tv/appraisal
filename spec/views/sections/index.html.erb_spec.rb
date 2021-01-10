require 'rails_helper'

RSpec.describe "sections/index", type: :view do
  before(:each) do
    assign(:sections, [
      Section.create!(
        name: "Name",
        group: nil,
        percentage: 2.5,
        total_percentage: 3.5
      ),
      Section.create!(
        name: "Name",
        group: nil,
        percentage: 2.5,
        total_percentage: 3.5
      )
    ])
  end

  it "renders a list of sections" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
  end
end
