class AddZoneIdToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :zone_id, :integer
  end
end
