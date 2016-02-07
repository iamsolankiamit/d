class AddVersionToDisplay < ActiveRecord::Migration
  def change
    add_column :displays, :version, :string
  end
end
