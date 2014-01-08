class Zone < ActiveRecord::Base
  attr_accessible :zone_name, :zone_number
  has_many :sub_zones
end
