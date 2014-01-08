class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.integer :user_id
      t.integer :sub_zone_id

      t.timestamps
    end
  end
end
