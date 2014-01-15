class AddActionsToConsumers < ActiveRecord::Migration
  def change
    add_column :consumers, :actions, :integer
  end
end
