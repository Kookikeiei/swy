require 'spec_helper'

describe "rentals/new" do
  before(:each) do
    assign(:rental, stub_model(Rental,
      :room_no => "MyString",
      :rent => "MyString",
      :name => "MyString",
      :elec_unit => "MyString",
      :water_unit => "MyString",
      :unpay => "MyString"
    ).as_new_record)
  end

  it "renders new rental form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rentals_path, "post" do
      assert_select "input#rental_room_no[name=?]", "rental[room_no]"
      assert_select "input#rental_rent[name=?]", "rental[rent]"
      assert_select "input#rental_name[name=?]", "rental[name]"
      assert_select "input#rental_elec_unit[name=?]", "rental[elec_unit]"
      assert_select "input#rental_water_unit[name=?]", "rental[water_unit]"
      assert_select "input#rental_unpay[name=?]", "rental[unpay]"
    end
  end
end
