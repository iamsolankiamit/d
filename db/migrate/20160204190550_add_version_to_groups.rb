class AddVersionToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :version, :integer
  end
end
