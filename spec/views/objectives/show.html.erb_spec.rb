require 'rails_helper'

RSpec.describe "objectives/show", type: :view do
  before(:each) do
    @objective = assign(:objective, Objective.create!(
      name: "Name",
      section: nil,
      percentage: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
  end
end
