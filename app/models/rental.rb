class Rental < ActiveRecord::Base
  attr_accessible :elec_unit, :name, :rent, :room_no, :unpay, :water_unit
end
