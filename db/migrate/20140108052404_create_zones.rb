class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.integer :zone_number
      t.string :zone_name

      t.timestamps
    end
  end
end
