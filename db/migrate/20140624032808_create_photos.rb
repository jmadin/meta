class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_category
      t.string :photo_filename
      t.string :photo_term
      t.references :user, index: true
      t.date :photo_date
      t.string :genus_species
      t.text :photo_notes

      t.timestamps
    end
  end
end
