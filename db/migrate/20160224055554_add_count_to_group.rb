class AddCountToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :count, :integer, default: 0
  end
end
