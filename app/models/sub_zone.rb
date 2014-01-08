class SubZone < ActiveRecord::Base
  attr_accessible :name, :zone_id
  belongs_to :zone
end
