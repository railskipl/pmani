class Reader < ActiveRecord::Base
  attr_accessible :sub_zone_id, :user_id
  belongs_to :sub_zone
  belongs_to :user
end
