class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.text :margue
      t.attachment :left_photo
      t.attachment :right_photo
      t.attachment :bottom_photo
      t.attachment :signage_video
      t.timestamps null: false
    end
  end
end
