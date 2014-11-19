class CreateAlbum < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.references :artist
    end
  end
end
