require 'spec_helper'

describe "rentals/show" do
  before(:each) do
    @rental = assign(:rental, stub_model(Rental,
      :room_no => "Room No",
      :rent => "Rent",
      :name => "Name",
      :elec_unit => "Elec Unit",
      :water_unit => "Water Unit",
      :unpay => "Unpay"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Room No/)
    rendered.should match(/Rent/)
    rendered.should match(/Name/)
    rendered.should match(/Elec Unit/)
    rendered.should match(/Water Unit/)
    rendered.should match(/Unpay/)
  end
end
