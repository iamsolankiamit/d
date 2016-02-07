class CreatePis < ActiveRecord::Migration
  def change
    create_table :pis do |t|
      t.string :name
      t.integer :uid
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
