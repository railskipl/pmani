class AddActionsToConsumers < ActiveRecord::Migration
  def change
    add_column :consumers, :actions, :integer, :default=>1
  end
end
