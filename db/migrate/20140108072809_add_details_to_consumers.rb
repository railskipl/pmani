class AddDetailsToConsumers < ActiveRecord::Migration
  def change
    add_column :consumers, :consumer_inxex_no, :string
    add_column :consumers, :meter_no, :string
    add_column :consumers, :new_meter_no, :string
    add_column :consumers, :current_meter_reading, :string
    add_column :consumers, :meter_status, :string
    add_column :consumers, :meter_status_desc, :string
    add_column :consumers, :remarks, :string
    add_column :consumers, :contact_no, :string
    add_column :consumers, :walk_id, :string
    add_column :consumers, :zone_id, :integer
    add_column :consumers, :date_time, :datetime
    add_column :consumers, :mr_code, :string
    add_column :consumers, :mr_name, :string
  end
end
