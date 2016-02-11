class AddLayoutTypeToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :layout_type, :string
  end
end
