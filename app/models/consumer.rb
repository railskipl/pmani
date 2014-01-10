class Consumer < ActiveRecord::Base
  attr_accessible :name, :sub_zone_id,:consumer_inxex_no,:meter_no, :new_meter_no, 
  				  :current_meter_reading,:meter_status,:meter_status_desc, :remarks,
  				  :contact_no, :walk_id,  :zone_id, :date_time, :mr_code,:mr_name,:image, 
  				  :billing_cycle, :consumer_address, :category, :latitude, :longitude
  				  
 belongs_to :sub_zone
 belongs_to :zone
 mount_uploader :image, ImageUploader
end
