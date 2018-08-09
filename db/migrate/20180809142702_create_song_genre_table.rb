class CreateSongGenreTable < ActiveRecord::Migration
  def change
    create_table song_genres do |t|
      t.integer :song_id
      t.interger :genre_id
    end
  end
end
