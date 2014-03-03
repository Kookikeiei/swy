require 'spec_helper'

describe "rentals/index" do
  before(:each) do
    assign(:rentals, [
      stub_model(Rental,
        :room_no => "Room No",
        :rent => "Rent",
        :name => "Name",
        :elec_unit => "Elec Unit",
        :water_unit => "Water Unit",
        :unpay => "Unpay"
      ),
      stub_model(Rental,
        :room_no => "Room No",
        :rent => "Rent",
        :name => "Name",
        :elec_unit => "Elec Unit",
        :water_unit => "Water Unit",
        :unpay => "Unpay"
      )
    ])
  end

  it "renders a list of rentals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Room No".to_s, :count => 2
    assert_select "tr>td", :text => "Rent".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Elec Unit".to_s, :count => 2
    assert_select "tr>td", :text => "Water Unit".to_s, :count => 2
    assert_select "tr>td", :text => "Unpay".to_s, :count => 2
  end
end
