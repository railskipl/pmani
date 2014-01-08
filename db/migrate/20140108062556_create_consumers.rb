class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :name
      t.integer :sub_zone_id

      t.timestamps
    end
  end
end
