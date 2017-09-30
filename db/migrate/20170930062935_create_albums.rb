class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :total_views
      t.string :cover_url

      t.timestamps
    end
  end
end
