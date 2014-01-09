class AddExtraDetailsToConsumers < ActiveRecord::Migration
  def change
    add_column :consumers, :billing_cycle, :string
    add_column :consumers, :consumer_address, :text
    add_column :consumers, :category, :string
    add_column :consumers, :latitude, :float
    add_column :consumers, :longitude, :float
  end
end
