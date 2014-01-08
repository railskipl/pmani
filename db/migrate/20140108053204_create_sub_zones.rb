class CreateSubZones < ActiveRecord::Migration
  def change
    create_table :sub_zones do |t|
      t.string :name
      t.integer :zone_id

      t.timestamps
    end
  end
end
