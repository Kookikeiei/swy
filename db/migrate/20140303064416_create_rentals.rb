class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :room_no
      t.string :rent
      t.string :name
      t.string :elec_unit
      t.string :water_unit
      t.string :unpay

      t.timestamps
    end
  end
end
