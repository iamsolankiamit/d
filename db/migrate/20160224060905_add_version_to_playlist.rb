class AddVersionToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :version, :integer, default: 0
  end
end
