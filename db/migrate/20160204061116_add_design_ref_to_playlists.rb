class AddDesignRefToPlaylists < ActiveRecord::Migration
  def change
    add_reference :playlists, :design, index: true, foreign_key: true
  end
end
