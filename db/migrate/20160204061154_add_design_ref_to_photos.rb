class AddDesignRefToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :design, index: true, foreign_key: true
  end
end
