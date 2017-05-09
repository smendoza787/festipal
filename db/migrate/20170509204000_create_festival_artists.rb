class CreateFestivalArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :festival_artists do |t|
      t.integer :artist_id
      t.integer :festival_id
    end
  end
end
